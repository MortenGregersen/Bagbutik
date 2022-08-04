import BagbutikSpecDecoder
import Foundation

/// Errors that can occur when loading docs
public enum DocsLoaderError: Error, Equatable {
    /// The documentation hasn't been loaded yet
    case documentationNotLoaded
    /// The type of the documentation is wrong
    case wrongTypeOfDocumentation
    /// The package name could not be resolved
    case couldNotResolvePackageName(id: String, paths: [[String]])
}

public class DocsLoader {
    private let loadFile: (URL) throws -> Data
    internal var operationDocumentationById: [String: OperationDocumentation]?
    internal var identifierBySchemaName: [String: String]?
    internal var schemaDocumentationById: [String: Documentation]?

    public convenience init() {
        self.init(operationDocumentationById: nil) // A parameter is needed for it to call the internal initializer
    }

    internal init(loadFile: @escaping (URL) throws -> Data = { url in try Data(contentsOf: url) }, operationDocumentationById: [String: OperationDocumentation]? = nil, identifierBySchemaName: [String: String]? = nil, schemaDocumentationById: [String: Documentation]? = nil) {
        self.loadFile = loadFile
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
            guard case .operation(let operationDocumentation) = documentation else { throw DocsLoaderError.wrongTypeOfDocumentation }
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

    public func resolvePackageName(for documentation: Documentation) throws -> PackageName {
        let packageNames = documentation.hierarchy.paths.compactMap { $0.compactMap(PackageName.resolvePackageName(from:)).first }
        guard let packageName = packageNames.first else {
            let paths = documentation.hierarchy.paths.flatMap { $0 }
            guard let longestPath = paths.sorted(by: { $0.lengthOfBytes(using: .utf8) > $1.lengthOfBytes(using: .utf8) }).first,
                  longestPath == "doc://com.apple.documentation/documentation/appstoreconnectapi" else {
                throw DocsLoaderError.couldNotResolvePackageName(id: documentation.id, paths: documentation.hierarchy.paths)
            }
            return .core
        }
        return packageName
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
