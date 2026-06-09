import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// Errors that can occur while rendering Swift sources from the spec and collected docs.
public enum GeneratorError: Error, Equatable {
    /// The URL is not a file URL
    case notFileUrl(FileURLType)
    /// The operation has no documentation
    case noDocumentationForOperation(String)
    /// The schema has no documentation
    case noDocumentationForSchema(String)
    /// The file could not be created
    case couldNotCreateFile(String)

    /// The type of the file URL
    public enum FileURLType: Sendable {
        /// The URL for the spec file
        case specFileURL
        /// The URL for the output directory
        case outputDirURL
        /// The URL for the documentation directory
        case documentationDirUrl
    }
}

/**
 The closure used to load and decode the OpenAPI spec from disk.

 Keeping this injectable makes the generator straightforward to unit test.

 - Parameter fileUrl: The file URL of the OpenAPI spec.
 - Returns: A decoded ``Spec`` value.
 */
typealias LoadSpec = (_ fileUrl: URL) throws -> Spec

/// Generates endpoint and model source files from the decoded spec and normalized documentation.
public class Generator {
    private let loadSpec: LoadSpec
    private let fileManager: TestableFileManager
    private let docsLoader: DocsLoader
    private let print: @MainActor (String) -> Void

    /// Creates a generator configured with the default spec loader, docs loader, and file manager.
    public convenience init() {
        let loadSpec: LoadSpec = { fileUrl in
            let specData = try Data(contentsOf: fileUrl)
            var spec = try JSONDecoder().decode(Spec.self, from: specData)
            try spec.applyManualPatches()
            spec.flattenIdenticalSchemas()
            return spec
        }
        self.init(loadSpec: loadSpec, fileManager: FileManager.default, docsLoader: DocsLoader(), print: { Swift.print($0) })
    }

    init(loadSpec: @escaping LoadSpec, fileManager: TestableFileManager, docsLoader: DocsLoader, print: @escaping @MainActor (String) -> Void) {
        self.loadSpec = loadSpec
        self.fileManager = fileManager
        self.docsLoader = docsLoader
        self.print = print
    }

    /**
     Loads a spec and renders all endpoint and model files into the output directory.

     The generator expects documentation JSON produced by ``DocsFetcher`` and loaded through
     ``DocsLoader`` so generated symbols can include Apple's documentation in Xcode.

     - Parameters:
        - specFileURL: The file URL of the OpenAPI spec.
        - outputDirURL: The root directory where generated source files should be written.
        - documentationDirURL: The directory containing the normalized documentation cache.
     */
    public func generateAll(specFileURL: URL, outputDirURL: URL, documentationDirURL: URL) async throws {
        guard specFileURL.isFileURL else { throw GeneratorError.notFileUrl(.specFileURL) }
        guard outputDirURL.isFileURL else { throw GeneratorError.notFileUrl(.outputDirURL) }
        guard documentationDirURL.isFileURL else { throw GeneratorError.notFileUrl(.documentationDirUrl) }
        await print("🔍 Loading spec \(specFileURL.path)...")
        let spec = try loadSpec(specFileURL)

        await print("🔍 Loading docs \(documentationDirURL.path)...")
        try await docsLoader.loadDocs(documentationDirURL: documentationDirURL)
        try await docsLoader.applyManualDocumentation()

        let generalModelsDirURL = outputDirURL.appendingPathComponent("Bagbutik-Models")
        for packageName in PackageName.allCases {
            let packageDirURL = outputDirURL.appendingPathComponent(packageName.name)
            if packageName != .core {
                try removeChildren(at: packageDirURL)
                try fileManager.createDirectory(at: packageDirURL, withIntermediateDirectories: true, attributes: nil)
            } else {
                let endpointsDirURL = packageDirURL.appendingPathComponent("Endpoints")
                try removeChildren(at: endpointsDirURL)
                try fileManager.createDirectory(at: endpointsDirURL, withIntermediateDirectories: true, attributes: nil)
                let modelsDirURL = packageDirURL.appendingPathComponent("Models")
                try removeChildren(at: modelsDirURL)
                try fileManager.createDirectory(at: modelsDirURL, withIntermediateDirectories: true, attributes: nil)
            }

            try removeChildren(at: generalModelsDirURL.appendingPathComponent(packageName.docsSectionName))
            try fileManager.createDirectory(at: generalModelsDirURL, withIntermediateDirectories: true, attributes: nil)
        }

        try await withThrowingTaskGroup(of: [RenderResult].self) { taskGroup in
            for path in spec.paths.values {
                taskGroup.addTask { [docsLoader] in
                    var renderResults = [RenderResult]()
                    let operationRenderer = OperationRenderer(docsLoader: docsLoader, shouldFormat: true)
                    for operation in path.operations {
                        let name = operation.getVersionedName(path: path)
                        let fileName = "\(name).swift"
                        let packageName: PackageName
                        if let documentation = try await docsLoader.resolveDocumentationForOperation(withId: operation.id) {
                            packageName = try DocsLoader.resolvePackageName(for: Documentation.operation(documentation))
                        } else if let inferredPackageName = DocsLoader.resolvePackageName(from: operation.id) {
                            packageName = inferredPackageName
                        } else {
                            throw GeneratorError.noDocumentationForOperation(operation.id)
                        }
                        let renderedOperation = try await operationRenderer.render(operation: operation, in: path) + "\n"
                        let packageDirURL = outputDirURL.appendingPathComponent(packageName.name).appendingPathComponent("Endpoints")
                        let operationDirURL = Self.getOperationsDirURL(for: path, in: packageDirURL)
                        renderResults.append(.init(dirURL: operationDirURL, name: name, fileName: fileName, contents: renderedOperation))
                    }
                    return renderResults
                }
            }
            for try await renderResults in taskGroup {
                for renderResult in renderResults {
                    await print("⚡️ Generating endpoint \(renderResult.name)...")
                    try self.fileManager.createDirectory(at: renderResult.dirURL, withIntermediateDirectories: true, attributes: nil)
                    let fileURL = renderResult.dirURL.appendingPathComponent(renderResult.fileName)
                    guard self.fileManager.createFile(atPath: fileURL.path, contents: renderResult.contents.data(using: .utf8), attributes: nil) else {
                        throw GeneratorError.couldNotCreateFile(fileURL.path)
                    }
                }
            }
        }

        try await withThrowingTaskGroup(of: RenderResult.self) { taskGroup in
            let schemas = spec.components.schemas
            for schema in schemas.values {
                taskGroup.addTask { [docsLoader, schemas] in
                    let packageName: PackageName
                    if let documentation = try await docsLoader.resolveDocumentationForSchema(named: schema.name) {
                        packageName = try DocsLoader.resolvePackageName(for: documentation)
                    } else if let inferredPackageName = DocsLoader.resolvePackageName(from: schema.name) {
                        packageName = inferredPackageName
                    } else {
                        throw GeneratorError.noDocumentationForSchema(schema.name)
                    }
                    let model = try await Generator.generateModel(for: schema, packageName: packageName, otherSchemas: schemas, docsLoader: docsLoader)
                    let fileName = model.name + ".swift"

                    let modelsDirURL: URL = if schema.name.hasSuffix("LinkagesRequest") || schema.name.hasSuffix("LinkageRequest") {
                        outputDirURL
                            .appendingPathComponent("Bagbutik-Models")
                            .appendingPathComponent("LinkageRequests")
                    } else if schema.name.hasSuffix("LinkagesResponse") || schema.name.hasSuffix("LinkageResponse") {
                        outputDirURL
                            .appendingPathComponent("Bagbutik-Models")
                            .appendingPathComponent("LinkageResponses")
                    } else if packageName == .core || schema.name.hasSuffix("Request") || schema.name.hasSuffix("Response") {
                        outputDirURL
                            .appendingPathComponent(packageName.name)
                            .appendingPathComponent("Models")
                    } else {
                        outputDirURL
                            .appendingPathComponent("Bagbutik-Models")
                            .appendingPathComponent(packageName.docsSectionName)
                    }
                    return .init(dirURL: modelsDirURL, name: model.name, fileName: fileName, contents: model.contents)
                }
            }
            for try await renderResult in taskGroup {
                await print("⚡️ Generating model \(renderResult.name)...")
                try self.fileManager.createDirectory(at: renderResult.dirURL, withIntermediateDirectories: true, attributes: nil)
                let fileURL = renderResult.dirURL.appendingPathComponent(renderResult.fileName)
                guard self.fileManager.createFile(atPath: fileURL.path, contents: renderResult.contents.data(using: .utf8), attributes: nil) else {
                    throw GeneratorError.couldNotCreateFile(fileURL.path)
                }
            }
        }

        let operationsCount = spec.paths.reduce(into: 0) { $0 += $1.value.operations.count }
        let modelsCount = spec.components.schemas.count
        await print("🎉 Finished generating \(operationsCount) endpoints and \(modelsCount) models! 🎉")
    }

    private struct RenderResult {
        let dirURL: URL
        let name: String
        let fileName: String
        let contents: String
    }

    private func removeChildren(at url: URL) throws {
        if fileManager.fileExists(atPath: url.path) {
            try fileManager.removeItem(at: url)
        }
    }

    private static func getOperationsDirURL(for path: Path, in endpointsDirURL: URL) -> URL {
        let operationsDirURL = endpointsDirURL.appendingPathComponent(path.info.mainType)
        guard path.info.isRelationship else { return operationsDirURL }
        return operationsDirURL.appendingPathComponent("Relationships")
    }

    /**
     Renders one schema into the generated Swift source for the appropriate package.

     - Parameters:
        - schema: The schema to render.
        - packageName: The package that should contain the generated type.
        - otherSchemas: The complete schema index, used to resolve references while rendering.
        - docsLoader: The documentation loader used to resolve symbol comments.
     - Returns: The rendered model name, its full file contents, and the original schema documentation URL.
     */
    static func generateModel(for schema: Schema, packageName: PackageName, otherSchemas: [String: Schema], docsLoader: DocsLoader)
        async throws -> (name: String, contents: String, url: String?) {
        let renderedSchema: String = switch schema {
        case .enum(let enumSchema):
            try await EnumSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(enumSchema: enumSchema)
        case .object(let objectSchema):
            try await ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(objectSchema: objectSchema, otherSchemas: otherSchemas)
        case .binary(let binarySchema):
            try await BinarySchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(binarySchema: binarySchema)
        case .plainText(let plainTextSchema):
            try await PlainTextSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(plainTextSchema: plainTextSchema)
        }
        var imports = ["import Foundation"]
        if packageName != .core {
            imports.append("import Bagbutik_Core")
            if schema.name.hasSuffix("Request") || schema.name.hasSuffix("Response") {
                imports.append("import Bagbutik_Models")
            }
        } else if schema.name.hasSuffix("LinkagesRequest") || schema.name.hasSuffix("LinkageRequest")
            || schema.name.hasSuffix("LinkagesResponse") || schema.name.hasSuffix("LinkageResponse") {
            imports.append("import Bagbutik_Core")
        }
        let contents = """
        \(imports.sorted().joined(separator: "\n"))

        \(renderedSchema)
        
        """
        return (name: schema.name, contents: contents, url: schema.url)
    }
}
