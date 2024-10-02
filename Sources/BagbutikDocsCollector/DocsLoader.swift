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
        self.schemaDocumentationById = schemaDocumentationById
    }

    public func loadDocs(documentationDirURL: URL) async throws {
        let operationDocumentationByIdData = try await loadFile(documentationDirURL.appendingPathComponent(DocsFilename.operationDocumentation.filename))
        let identifierBySchemaNameData = try await loadFile(documentationDirURL.appendingPathComponent(DocsFilename.schemaMapping.filename))
        let schemaDocumentationByIdData = try await loadFile(documentationDirURL.appendingPathComponent(DocsFilename.schemaDocumentation.filename))
        let jsonDecoder = JSONDecoder()
        self.operationDocumentationById = try jsonDecoder.decode([String: Documentation].self, from: operationDocumentationByIdData).mapValues { documentation in
            guard case .operation(let operationDocumentation) = documentation else { throw DocsLoaderError.wrongTypeOfDocumentation }
            return operationDocumentation
        }
        self.identifierBySchemaName = try jsonDecoder.decode([String: String].self, from: identifierBySchemaNameData)
        self.schemaDocumentationById = try jsonDecoder.decode([String: Documentation].self, from: schemaDocumentationByIdData)
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
        let packageNames = documentation.hierarchy.paths.compactMap { $0.compactMap(PackageName.resolvePackageName(from:)).first }
        guard let packageName = packageNames.first else {
            let paths = documentation.hierarchy.paths.flatMap { $0 }
            guard let longestPath = paths.sorted(by: { $0.lengthOfBytes(using: .utf8) > $1.lengthOfBytes(using: .utf8) }).first,
                  longestPath == "doc://com.apple.documentation/documentation/appstoreconnectapi" else {
                throw DocsLoaderError.couldNotResolvePackageName(id: documentation.id, paths: documentation.hierarchy.paths)
            }
            if documentation.id.hasSuffix("ageratingdeclarationwithoutincludesresponse")
                || documentation.id.hasSuffix("apppreorderwithoutincludesresponse")
                || documentation.id.hasSuffix("territorieswithoutincludesresponse") {
                return .appStore
            }
            return .core
        }
        return packageName
    }

    public func resolveDocumentationForSchema(named schemaName: String) throws -> Documentation? {
        guard let identifierBySchemaName,
              let schemaDocumentationById else {
            throw DocsLoaderError.documentationNotLoaded
        }
        guard let identifier = identifierBySchemaName[schemaName],
              let documentation = schemaDocumentationById[identifier] else {
            return nil
        }
        return documentation
    }

    public func resolveDocumentationForSchema(withDocsUrl docsUrl: String) throws -> Documentation? {
        guard let schemaDocumentationById else { throw DocsLoaderError.documentationNotLoaded }
        let identifier = self.createDocumentationId(fromUrl: docsUrl)
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
        url.replacingOccurrences(of: "https://developer.apple.com", with: "doc://com.apple.documentation")
    }
}
