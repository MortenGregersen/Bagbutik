import BagbutikDocsCollector
import BagbutikSpecDecoder
import Foundation

/// Errors that can occur when generating
public enum GeneratorError: Error {
    /// The URL is not a file URL
    case notFileUrl(FileURLType)
    /// The operation in the path has no documentation
    case noDocumentationForOperationInPath(String)
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

extension GeneratorError: Equatable {}

/**
 An alias for a function loading a spec from a file URL

 - Parameter fileUrl: The file URL to load the spec from
 - Returns: A decoded Spec
 */
internal typealias LoadSpec = (_ fileUrl: URL) throws -> Spec

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

    internal init(loadSpec: @escaping LoadSpec, fileManager: TestableFileManager, docsLoader: DocsLoader, print: @escaping (String) -> Void) {
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
        print("🔍 Loading spec \(specFileURL)...")
        let spec = try loadSpec(specFileURL)

        print("🔍 Loading docs \(documentationDirURL)...")
        try docsLoader.loadDocs(documentationDirURL: documentationDirURL)
        try docsLoader.applyManualDocumentation()

        try PackageName.allCases.forEach { packageName in
            let packageDirURL = outputDirURL.appendingPathComponent(packageName.name)
            let endpointsDirURL = packageDirURL.appendingPathComponent("Endpoints")
            try removeChildren(at: endpointsDirURL)
            let modelsDirURL = packageDirURL.appendingPathComponent("Models")
            try removeChildren(at: modelsDirURL)
        }

        try await withThrowingTaskGroup(of: Void.self) { taskGroup in
            spec.paths.values.forEach { path in
                taskGroup.addTask {
                    guard let firstOperation = path.operations.first,
                          let documentation = try self.docsLoader.resolveDocumentationForOperation(withId: firstOperation.id) else {
                        throw GeneratorError.noDocumentationForOperationInPath(path.path)
                    }
                    let packageName = try self.docsLoader.resolvePackageName(for: Documentation.operation(documentation))
                    let endpointsDirURL = outputDirURL
                        .appendingPathComponent(packageName.name)
                        .appendingPathComponent("Endpoints")
                    let operationsDirURL = Self.getOperationsDirURL(for: path, in: endpointsDirURL)
                    try self.fileManager.createDirectory(at: operationsDirURL, withIntermediateDirectories: true, attributes: nil)
                    try Self.generateEndpoints(for: path, docsLoader: self.docsLoader).forEach { endpoint in
                        let fileURL = operationsDirURL.appendingPathComponent(endpoint.fileName)
                        self.print("⚡️ Generating endpoint \(endpoint.fileName)...")
                        guard self.fileManager.createFile(atPath: fileURL.path, contents: endpoint.contents.data(using: .utf8), attributes: nil) else {
                            throw GeneratorError.couldNotCreateFile(endpoint.fileName)
                        }
                    }
                }
            }
            for try await _ in taskGroup {}
        }

        try await withThrowingTaskGroup(of: Void.self) { taskGroup in
            spec.components.schemas.values.forEach { schema in
                taskGroup.addTask {
                    self.print("⚡️ Generating model \(schema.name)...")
                    let model = try Self.generateModel(for: schema, otherSchemas: spec.components.schemas, docsLoader: self.docsLoader)
                    let fileName = model.name + ".swift"
                    guard let documentation = try self.docsLoader.resolveDocumentationForSchema(named: schema.name) else {
                        throw GeneratorError.noDocumentationForSchema(schema.name)
                    }
                    let packageName = try self.docsLoader.resolvePackageName(for: documentation)
                    let fileURL = outputDirURL
                        .appendingPathComponent(packageName.name)
                        .appendingPathComponent("Models")
                        .appendingPathComponent(fileName)
                    guard self.fileManager.createFile(atPath: fileURL.path, contents: model.contents.data(using: .utf8), attributes: nil) else {
                        throw GeneratorError.couldNotCreateFile(fileName)
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
        try fileManager.removeItem(at: url)
        try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
    }

    private static func getOperationsDirURL(for path: Path, in endpointsDirURL: URL) -> URL {
        let operationsDirURL = endpointsDirURL.appendingPathComponent(path.info.mainType)
        guard path.info.isRelationship else { return operationsDirURL }
        return operationsDirURL.appendingPathComponent("Relationships")
    }

    private static func generateEndpoints(for path: Path, docsLoader: DocsLoader) throws -> [(name: String, fileName: String, contents: String)] {
        try path.operations.map { operation in
            let name = operation.name.capitalizingFirstLetter()
            let fileName = "\(name)\(path.info.version).swift"
            let renderedOperation = try OperationRenderer(docsLoader: docsLoader).render(operation: operation, in: path)
            return (name: name, fileName: fileName, contents: renderedOperation)
        }
    }

    private static func generateModel(for schema: Schema, otherSchemas: [String: Schema], docsLoader: DocsLoader)
        throws -> (name: String, contents: String, url: String?) {
        let renderedSchema: String
        switch schema {
        case .enum(let enumSchema):
            renderedSchema = try EnumSchemaRenderer(docsLoader: docsLoader)
                .render(enumSchema: enumSchema)
        case .object(let objectSchema):
            renderedSchema = try ObjectSchemaRenderer(docsLoader: docsLoader)
                .render(objectSchema: objectSchema, otherSchemas: otherSchemas)
        case .binary(let binarySchema):
            renderedSchema = try BinarySchemaRenderer(docsLoader: docsLoader)
                .render(binarySchema: binarySchema)
        case .plainText(let plainTextSchema):
            renderedSchema = try PlainTextSchemaRenderer(docsLoader: docsLoader)
                .render(plainTextSchema: plainTextSchema)
        }
        let contents = """
        import Foundation

        \(renderedSchema)
        """
        return (name: schema.name, contents: contents, url: schema.url)
    }
}
