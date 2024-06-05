import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// Errors that can occur when generating
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
    public enum FileURLType {
        /// The URL for the spec file
        case specFileURL
        /// The URL for the output directory
        case outputDirURL
        /// The URL for the documentation directory
        case documentationDirUrl
    }
}

/**
 An alias for a function loading a spec from a file URL

 - Parameter fileUrl: The file URL to load the spec from
 - Returns: A decoded Spec
 */
typealias LoadSpec = (_ fileUrl: URL) throws -> Spec

/// A generator which loads a spec and generates endpoints and models from the spec
public class Generator {
    private let loadSpec: LoadSpec
    private let fileManager: TestableFileManager
    private let docsLoader: DocsLoader
    private let print: (String) -> Void

    /// Initialize a new generator
    public convenience init() {
        let loadSpec: LoadSpec = { fileUrl in
            let specData = try Data(contentsOf: fileUrl)
            var spec = try JSONDecoder().decode(Spec.self, from: specData)
            spec.addForgottenIncludeParameters()
            spec.flattenIdenticalSchemas()
            try spec.applyManualPatches()
            return spec
        }
        self.init(loadSpec: loadSpec, fileManager: FileManager.default, docsLoader: DocsLoader(), print: { Swift.print($0) })
    }

    init(loadSpec: @escaping LoadSpec, fileManager: TestableFileManager, docsLoader: DocsLoader, print: @escaping (String) -> Void) {
        self.loadSpec = loadSpec
        self.fileManager = fileManager
        self.docsLoader = docsLoader
        self.print = print
    }

    /**
     Load a spec file and generate endpoints and models from the spec

     - Parameters:
        - specFileURL: The file URL to load the spec from
        - outputDirURL: The file URL for the directory where the generated code should be saved
        - documentationDirURL: The file URL for the directory containing the fetched documentation
     */
    public func generateAll(specFileURL: URL, outputDirURL: URL, documentationDirURL: URL) async throws {
        guard specFileURL.isFileURL else { throw GeneratorError.notFileUrl(.specFileURL) }
        guard outputDirURL.isFileURL else { throw GeneratorError.notFileUrl(.outputDirURL) }
        guard documentationDirURL.isFileURL else { throw GeneratorError.notFileUrl(.documentationDirUrl) }
        print("🔍 Loading spec \(specFileURL.path)...")
        let spec = try loadSpec(specFileURL)

        print("🔍 Loading docs \(documentationDirURL.path)...")
        try docsLoader.loadDocs(documentationDirURL: documentationDirURL)
        try docsLoader.applyManualDocumentation()

        let modelsDirURL = outputDirURL.appendingPathComponent("Bagbutik-Models")
        try PackageName.allCases.filter { $0 != .core }.forEach { packageName in
            let packageDirURL = outputDirURL.appendingPathComponent(packageName.name)
            try removeChildren(at: packageDirURL)
            try fileManager.createDirectory(at: packageDirURL, withIntermediateDirectories: true, attributes: nil)
            let modelsPackageDirURL = modelsDirURL.appendingPathComponent(packageName.docsSectionName)
            try removeChildren(at: modelsPackageDirURL)
        }
        let coreModelsDirURL = outputDirURL
            .appendingPathComponent(PackageName.core.name)
            .appendingPathComponent("Models")
        try removeChildren(at: coreModelsDirURL)

        try await withThrowingTaskGroup(of: Void.self) { taskGroup in
            let operationRenderer = OperationRenderer(docsLoader: docsLoader, shouldFormat: true)
            spec.paths.values.forEach { path in
                taskGroup.addTask {
                    try path.operations.forEach { operation in
                        let name = operation.getVersionedName(path: path)
                        self.print("⚡️ Generating endpoint \(name)...")
                        let fileName = "\(name).swift"
                        guard let documentation = try self.docsLoader.resolveDocumentationForOperation(withId: operation.id) else {
                            throw GeneratorError.noDocumentationForOperation(operation.id)
                        }
                        let renderedOperation = try operationRenderer.render(operation: operation, in: path)
                        let packageName: PackageName
                        packageName = try DocsLoader.resolvePackageName(for: Documentation.operation(documentation))
                        let packageDirURL = outputDirURL.appendingPathComponent(packageName.name)
                        let operationDirURL = Self.getOperationsDirURL(for: path, in: packageDirURL)
                        try self.fileManager.createDirectory(at: operationDirURL, withIntermediateDirectories: true, attributes: nil)
                        let fileURL = operationDirURL.appendingPathComponent(fileName)
                        guard self.fileManager.createFile(atPath: fileURL.path, contents: renderedOperation.data(using: .utf8), attributes: nil) else {
                            throw GeneratorError.couldNotCreateFile(fileURL.path)
                        }
                    }
                }
            }
            for try await _ in taskGroup {}
        }

        try await withThrowingTaskGroup(of: Void.self) { taskGroup in
            spec.components.schemas.values.forEach { schema in
                taskGroup.addTask {
                    guard let documentation = try self.docsLoader.resolveDocumentationForSchema(named: schema.name) else {
                        throw GeneratorError.noDocumentationForSchema(schema.name)
                    }
                    let packageName = try DocsLoader.resolvePackageName(for: documentation)
                    self.print("⚡️ Generating model \(schema.name)...")
                    let model = try Self.generateModel(for: schema, packageName: packageName, otherSchemas: spec.components.schemas, docsLoader: self.docsLoader)
                    let fileName = model.name + ".swift"
                    let modelsDirURL: URL
                    if packageName == .core {
                        modelsDirURL = outputDirURL
                            .appendingPathComponent(packageName.name)
                            .appendingPathComponent("Models")
                    } else {
                        modelsDirURL = outputDirURL
                            .appendingPathComponent("Bagbutik-Models")
                            .appendingPathComponent(packageName.docsSectionName)
                    }
                    try self.fileManager.createDirectory(at: modelsDirURL, withIntermediateDirectories: true, attributes: nil)
                    let fileURL = modelsDirURL.appendingPathComponent(fileName)
                    guard self.fileManager.createFile(atPath: fileURL.path, contents: model.contents.data(using: .utf8), attributes: nil) else {
                        throw GeneratorError.couldNotCreateFile(fileURL.path)
                    }
                }
            }
            for try await _ in taskGroup {}
        }

        let operationsCount = spec.paths.reduce(into: 0) { $0 += $1.value.operations.count }
        let modelsCount = spec.components.schemas.count
        print("🎉 Finished generating \(operationsCount) endpoints and \(modelsCount) models! 🎉")
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

    internal static func generateModel(for schema: Schema, packageName: PackageName, otherSchemas: [String: Schema], docsLoader: DocsLoader)
        throws -> (name: String, contents: String, url: String?) {
        let renderedSchema: String
        switch schema {
        case .enum(let enumSchema):
            renderedSchema = try EnumSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(enumSchema: enumSchema)
        case .object(let objectSchema):
            renderedSchema = try ObjectSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(objectSchema: objectSchema, otherSchemas: otherSchemas)
        case .binary(let binarySchema):
            renderedSchema = try BinarySchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(binarySchema: binarySchema)
        case .plainText(let plainTextSchema):
            renderedSchema = try PlainTextSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
                .render(plainTextSchema: plainTextSchema)
        }
        var imports = ["import Foundation"]
        if packageName != .core {
            imports.append("import Bagbutik_Core")
        }
        let contents = """
        \(imports.sorted().joined(separator: "\n"))

        \(renderedSchema)
        """
        return (name: schema.name, contents: contents, url: schema.url)
    }
}
