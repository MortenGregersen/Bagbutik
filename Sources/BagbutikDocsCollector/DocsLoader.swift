import BagbutikSpecDecoder
import Foundation

/// Errors that can occur when loading docs
public enum DocsLoaderError: Error {
    /// The documentation hasn't been loaded yet
    case documentationNotLoaded
}

public class DocsLoader {
    private let loadFile: (URL) throws -> Data
    internal var operationDocumentationById: [String: OperationDocumentation]?
    internal var identifierBySchemaName: [String: String]?
    internal var schemaDocumentationById: [String: Documentation]?

    public convenience init() {
        self.init(loadFile: { url in try Data(contentsOf: url) })
    }

    internal init(loadFile: @escaping (URL) throws -> Data) {
        self.loadFile = loadFile
    }

    internal convenience init(operationDocumentationById: [String: OperationDocumentation]? = nil, identifierBySchemaName: [String: String]? = nil, schemaDocumentationById: [String: Documentation]? = nil) {
        self.init()
        self.operationDocumentationById = operationDocumentationById
        self.identifierBySchemaName = identifierBySchemaName
        self.schemaDocumentationById = schemaDocumentationById
    }

    public func loadDocs(documentationDirURL: URL) throws {
        let operationDocumentationByIdData = try loadFile(documentationDirURL.appendingPathComponent(DocsFilename.operationDocumentation.filename))
        let identifierBySchemaNameData = try loadFile(documentationDirURL.appendingPathComponent(DocsFilename.schemaMapping.filename))
        let schemaDocumentationByIdData = try loadFile(documentationDirURL.appendingPathComponent(DocsFilename.schemaDocumentation.filename))
        let jsonDecoder = JSONDecoder()
        self.operationDocumentationById = try jsonDecoder.decode([String: Documentation].self, from: operationDocumentationByIdData).mapValues { documentation in
            guard case .operation(let operationDocumentation) = documentation else { fatalError("Parsed documentation is not for operation") }
            return operationDocumentation
        }
        self.identifierBySchemaName = try jsonDecoder.decode([String: String].self, from: identifierBySchemaNameData)
        self.schemaDocumentationById = try jsonDecoder.decode([String: Documentation].self, from: schemaDocumentationByIdData)
    }

    public func applyManualDocumentation() throws {
        guard let identifierBySchemaName = identifierBySchemaName,
              var schemaDocumentationById = schemaDocumentationById else {
            throw DocsLoaderError.documentationNotLoaded
        }
        if let identifier = identifierBySchemaName["BundleIdPlatform"],
           case .enum(var bundleIdPlatformDocumentation) = schemaDocumentationById[identifier],
           bundleIdPlatformDocumentation.cases["UNIVERSAL"] == nil || bundleIdPlatformDocumentation.cases["UNIVERSAL"] == ""
        {
            bundleIdPlatformDocumentation.cases["UNIVERSAL"] = "A string that represents iOS and macOS."
            schemaDocumentationById[identifier] = .enum(bundleIdPlatformDocumentation)
        }
        self.schemaDocumentationById = schemaDocumentationById
    }

    public func resolveDocumentationForSchema(named schemaName: String) throws -> Documentation? {
        guard let identifierBySchemaName = identifierBySchemaName,
              let schemaDocumentationById = schemaDocumentationById else {
            throw DocsLoaderError.documentationNotLoaded
        }
        guard let identifier = identifierBySchemaName[schemaName],
              let documentation = schemaDocumentationById[identifier] else {
            return nil
        }
        return documentation
    }

    public func resolveDocumentationForSchema(withDocsUrl docsUrl: String) throws -> Documentation? {
        guard let schemaDocumentationById = schemaDocumentationById else { throw DocsLoaderError.documentationNotLoaded }
        let identifier = self.createDocumentationId(fromUrl: docsUrl)
        guard let documentation = schemaDocumentationById[identifier] else { return nil }
        return documentation
    }

    public func resolveDocumentationForSchema(withId identifier: String) throws -> Documentation? {
        guard let schemaDocumentationById = schemaDocumentationById else { throw DocsLoaderError.documentationNotLoaded }
        guard let documentation = schemaDocumentationById[identifier] else { return nil }
        return documentation
    }

    public func resolveDocumentationForOperation(withId operationId: String) throws -> OperationDocumentation? {
        guard let operationDocumentationById = operationDocumentationById else { throw DocsLoaderError.documentationNotLoaded }
        guard let documentation = operationDocumentationById[operationId] else { return nil }
        return documentation
    }

    public func createUrlForOperation(withId operationId: String) -> String {
        "https://developer.apple.com/documentation/appstoreconnectapi/" + OperationMapping.allMappings[operationId]!
    }

    private func createDocumentationId(fromUrl url: String) -> String {
        url.replacingOccurrences(of: "https://developer.apple.com", with: "doc://com.apple.documentation")
    }
}
