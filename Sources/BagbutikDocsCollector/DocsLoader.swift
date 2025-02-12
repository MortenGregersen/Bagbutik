import BagbutikSpecDecoder
import Foundation

/// Errors that can occur when loading docs
public enum DocsLoaderError: Error, Equatable {
    /// The documentation hasn't been loaded yet
    case documentationNotLoaded
    /// The type of the documentation is wrong
    case wrongTypeOfDocumentation
}

public actor DocsLoader {
    private let loadFile: @MainActor (URL) throws -> Data
    var operationDocumentationById: [String: OperationDocumentation]?
    var identifierBySchemaName: [String: String]?
    var schemaDocumentationById: [String: Documentation]?

    public init() {
        self.init(operationDocumentationById: nil) // A parameter is needed for it to call the internal initializer
    }

    init(loadFile: @escaping @MainActor (URL) throws -> Data = { url in try Data(contentsOf: url) }, operationDocumentationById: [String: OperationDocumentation]? = nil, identifierBySchemaName: [String: String]? = nil, schemaDocumentationById: [String: Documentation]? = nil) {
        self.loadFile = loadFile
        self.operationDocumentationById = operationDocumentationById
        self.identifierBySchemaName = identifierBySchemaName
        self.schemaDocumentationById = schemaDocumentationById.map { schemaDocumentationById in
            Dictionary(uniqueKeysWithValues: schemaDocumentationById.map { key, value in
                (key.lowercased(), value)
            })
        }
    }

    public func loadDocs(documentationDirURL: URL) async throws {
        let operationDocumentationByIdData = try await loadFile(documentationDirURL.appendingPathComponent(DocsFilename.operationDocumentation.filename))
        let identifierBySchemaNameData = try await loadFile(documentationDirURL.appendingPathComponent(DocsFilename.schemaMapping.filename))
        let schemaDocumentationByIdData = try await loadFile(documentationDirURL.appendingPathComponent(DocsFilename.schemaDocumentation.filename))
        let jsonDecoder = JSONDecoder()
        operationDocumentationById = try jsonDecoder.decode([String: Documentation].self, from: operationDocumentationByIdData).mapValues { documentation in
            guard case .operation(let operationDocumentation) = documentation else { throw DocsLoaderError.wrongTypeOfDocumentation }
            return operationDocumentation
        }
        identifierBySchemaName = try jsonDecoder.decode([String: String].self, from: identifierBySchemaNameData)
        let loadedSchemaDocumentationById = try jsonDecoder.decode([String: Documentation].self, from: schemaDocumentationByIdData)
        schemaDocumentationById = Dictionary(uniqueKeysWithValues: loadedSchemaDocumentationById.map { key, value in
            (key.lowercased(), value)
        })
    }

    public func applyManualDocumentation() throws {
        guard let identifierBySchemaName,
              var schemaDocumentationById else {
            throw DocsLoaderError.documentationNotLoaded
        }
        if let identifier = identifierBySchemaName["BundleIdPlatform"],
           case .enum(var bundleIdPlatformDocumentation) = schemaDocumentationById[identifier] {
            if bundleIdPlatformDocumentation.cases["SERVICES"] == nil || bundleIdPlatformDocumentation.cases["SERVICES"] == "" {
                bundleIdPlatformDocumentation.cases["SERVICES"] = "A string that represents a service."
            }
            if bundleIdPlatformDocumentation.cases["UNIVERSAL"] == nil || bundleIdPlatformDocumentation.cases["UNIVERSAL"] == "" {
                bundleIdPlatformDocumentation.cases["UNIVERSAL"] = "A string that represents iOS and macOS."
            }
            schemaDocumentationById[identifier] = .enum(bundleIdPlatformDocumentation)
        }
        if let identifier = identifierBySchemaName["Platform"],
           case .enum(var platformDocumentation) = schemaDocumentationById[identifier] {
            if platformDocumentation.cases["VISION_OS"] == nil || platformDocumentation.cases["VISION_OS"] == "" {
                platformDocumentation.cases["VISION_OS"] = "A string that represents visionOS."
            }
            schemaDocumentationById[identifier] = .enum(platformDocumentation)
        }
        self.schemaDocumentationById = schemaDocumentationById
    }

    public static func resolvePackageName(for documentation: Documentation) throws -> PackageName {
        let packageName = PackageName.resolvePackageName(from: documentation.id) ?? .core
        return packageName
    }

    public func resolveDocumentationForSchema(named schemaName: String) throws -> Documentation? {
        guard let identifierBySchemaName,
              let schemaDocumentationById else {
            throw DocsLoaderError.documentationNotLoaded
        }
        guard let identifier = identifierBySchemaName[schemaName]?.lowercased(),
              let documentation = schemaDocumentationById[identifier] else {
            return nil
        }
        return documentation
    }

    public func resolveDocumentationForSchema(withDocsUrl docsUrl: String) throws -> Documentation? {
        guard let schemaDocumentationById else { throw DocsLoaderError.documentationNotLoaded }
        let identifier = createDocumentationId(fromUrl: docsUrl)
        guard let documentation = schemaDocumentationById[identifier] else { return nil }
        return documentation
    }

    public func resolveDocumentationForSchema(withId identifier: String) throws -> Documentation? {
        guard let schemaDocumentationById else { throw DocsLoaderError.documentationNotLoaded }
        guard let documentation = schemaDocumentationById[identifier] else { return nil }
        return documentation
    }

    public func resolveDocumentationForOperation(withId operationId: String) throws -> OperationDocumentation? {
        guard let operationDocumentationById else { throw DocsLoaderError.documentationNotLoaded }
        guard let documentation = operationDocumentationById[operationId] else { return nil }
        return documentation
    }

    private func createDocumentationId(fromUrl url: String) -> String {
        url.replacingOccurrences(of: "https://developer.apple.com", with: "doc://com.apple.appstoreconnectapi")
    }
}
