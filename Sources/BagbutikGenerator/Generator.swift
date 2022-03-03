import BagbutikSpecDecoder
import Foundation

/**
 A file manager which can perform the operations needed by the Generator

 This is just an interface already implemented by Foundation's FileManager, needed to enable unit testing.

 # Reference
 <https://developer.apple.com/documentation/foundation/filemanager>
 */
public protocol GeneratorFileManager {
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1415371-createdirectory>
    func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey: Any]?) throws
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1410695-createfile>
    func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey: Any]?) -> Bool
    /// # Reference:
    /// <https://developer.apple.com/documentation/foundation/filemanager/1413590-removeitem>
    func removeItem(at URL: URL) throws
}

extension FileManager: GeneratorFileManager {}

/// Errors that can occur when generating
public enum GeneratorError: Error {
    /// The URL is not a file URL
    case notFileUrl(FileURLType)
    /// The file could not be created
    case couldNotCreateFile(String)

    /// The type of the file URL
    public enum FileURLType {
        /// The URL for the spec file
        case specFileURL
        /// The URL for the output directory
        case outputDirURL
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
    private let fileManager: GeneratorFileManager
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
        self.init(loadSpec: loadSpec, fileManager: FileManager.default, print: { Swift.print($0) })
    }

    internal init(loadSpec: @escaping LoadSpec, fileManager: GeneratorFileManager, print: @escaping (String) -> Void) {
        self.loadSpec = loadSpec
        self.fileManager = fileManager
        self.print = print
    }

    /**
     Load a spec file and generate endpoints and models from the spec

     - Parameters:
        - specFileURL: The file URL to load the spec from
        - outputDirURL: The file URL for the directory where the generated code should be saved
     */
    public func generateAll(specFileURL: URL, outputDirURL: URL) throws {
        guard specFileURL.isFileURL else { throw GeneratorError.notFileUrl(.specFileURL) }
        guard outputDirURL.isFileURL else { throw GeneratorError.notFileUrl(.outputDirURL) }
        print("🔍 Loading spec \(specFileURL)...")
        let spec = try loadSpec(specFileURL)

//        var endpointsMissingDocumentation = [String]()
//        let endpointsDirURL = outputDirURL.appendingPathComponent("Endpoints")
//        try removeChildren(at: endpointsDirURL)
//        try spec.paths.values.sorted(by: { $0.path < $1.path }).forEach { path in
//            let operationsDirURL = getOperationsDirURL(for: path, in: endpointsDirURL)
//            try fileManager.createDirectory(at: operationsDirURL, withIntermediateDirectories: true, attributes: nil)
//            try generateEndpoints(for: path).forEach { endpoint in
//                let fileURL = operationsDirURL.appendingPathComponent(endpoint.fileName)
//                print("⚡️ Generating endpoint \(endpoint.fileName)...")
//                guard fileManager.createFile(atPath: fileURL.path, contents: endpoint.contents.data(using: .utf8), attributes: nil) else {
//                    throw GeneratorError.couldNotCreateFile(endpoint.fileName)
//                }
//                if !endpoint.hasDocumentation {
//                    endpointsMissingDocumentation.append(endpoint.name)
//                }
//            }
//        }
//
//        var modelsMissingDocumentation = [(name: String, url: String?)]()
//        let modelsDirURL = outputDirURL.appendingPathComponent("Models")
//        try removeChildren(at: modelsDirURL)
//        try spec.components.schemas.values.sorted(by: { $0.name < $1.name }).forEach { schema in
//            let model = try generateModel(for: schema)
//            let fileName = model.name + ".swift"
//            let fileURL = modelsDirURL.appendingPathComponent(fileName)
//            print("⚡️ Generating model \(model.name)...")
//            guard fileManager.createFile(atPath: fileURL.path, contents: model.contents.data(using: .utf8), attributes: nil) else {
//                throw GeneratorError.couldNotCreateFile(fileName)
//            }
//            if !model.hasDocumentation {
//                modelsMissingDocumentation.append((name: model.name, url: model.url))
//            }
//        }
//
//        endpointsMissingDocumentation.forEach { endpointName in
//            print("⚠️ Documentation missing for endpoint: '\(endpointName)'")
//        }
//
//        modelsMissingDocumentation.forEach { model in
//            var log = "⚠️ Documentation missing for model: '\(model.name)'"
//            if let url = model.url { log += " (\(url))" }
//            print(log)
//        }

        let operationsCount = spec.paths.reduce(into: 0) { $0 += $1.value.operations.count }
        let modelsCount = spec.components.schemas.count
        print("🎉 Finished generating \(operationsCount) endpoints and \(modelsCount) models! 🎉")
    }

    private func removeChildren(at url: URL) throws {
        try fileManager.removeItem(at: url)
        try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
    }

    private func getOperationsDirURL(for path: Path, in endpointsDirURL: URL) -> URL {
        let operationsDirURL = endpointsDirURL.appendingPathComponent(path.info.mainType)
        guard path.info.isRelationship else { return operationsDirURL }
        return operationsDirURL.appendingPathComponent("Relationships")
    }

    private func generateEndpoints(for path: Path) throws -> [(name: String, fileName: String, contents: String, hasDocumentation: Bool)] {
        try path.operations.map { operation in
            let name = operation.name.capitalizingFirstLetter()
            let fileName = "\(name).swift"
            let renderedOperation = try OperationRenderer().render(operation: operation, in: path)
            return (name: name, fileName: fileName, contents: renderedOperation, hasDocumentation: operation.documentation != nil)
        }
    }

    private func generateModel(for schema: Schema) throws -> (name: String, contents: String, hasDocumentation: Bool, url: String?) {
        let renderedSchema: String
        let hasDocumentation: Bool
        let url: String?
        switch schema {
        case .enum(let enumSchema):
            renderedSchema = try EnumSchemaRenderer().render(enumSchema: enumSchema)
            hasDocumentation = enumSchema.documentation != nil
            url = enumSchema.url
        case .object(let objectSchema):
            renderedSchema = try ObjectSchemaRenderer().render(objectSchema: objectSchema)
            hasDocumentation = objectSchema.documentation != nil
            url = objectSchema.url
        }
        let contents = """
        import Foundation

        \(renderedSchema)
        """
        return (name: schema.name, contents: contents, hasDocumentation: hasDocumentation, url: url)
    }
}
