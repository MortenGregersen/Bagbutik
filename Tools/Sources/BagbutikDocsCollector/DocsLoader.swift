import BagbutikSpecDecoder
import Foundation

/// Errors that can occur while loading the local Markdown mirror.
public enum DocsLoaderError: Error, Equatable {
    /// Documentation has not been configured with ``loadDocs(documentationDirURL:)``.
    case documentationNotLoaded
}

/// Loads documentation directly from the local Apple Markdown mirror.
public actor DocsLoader {
    private let loadFile: @MainActor (URL) throws -> Data
    private var documentationDirURL: URL?
    private var documentationByKey = [String: Documentation]()
    private var injectedDocumentationById = [String: Documentation]()
    private var injectedOperationDocumentationById = [String: OperationDocumentation]()
    private var allowsMissingDocumentationWithoutLoad = false

    public init() {
        self.loadFile = { try Data(contentsOf: $0) }
    }

    init(loadFile: @escaping @MainActor (URL) throws -> Data) {
        self.loadFile = loadFile
    }

    init(schemaDocumentationById: [String: Documentation]) {
        self.loadFile = { _ in Data() }
        self.injectedDocumentationById = schemaDocumentationById
        self.allowsMissingDocumentationWithoutLoad = true
    }

    init(operationDocumentationById: [String: OperationDocumentation]) {
        self.loadFile = { _ in Data() }
        self.injectedOperationDocumentationById = operationDocumentationById
        self.allowsMissingDocumentationWithoutLoad = true
    }

    /**
     Configures the directory containing the Apple Markdown mirror.

     - Parameter documentationDirURL: The directory containing the Markdown files written by ``DocsFetcher``.
     */
    public func loadDocs(documentationDirURL: URL) async throws {
        self.documentationDirURL = documentationDirURL
        documentationByKey = [:]
    }

    /// Retained for compatibility with the generation workflow.
    public func applyManualDocumentation() throws {}

    public static func resolvePackageName(for documentation: Documentation) throws -> PackageName {
        PackageName.resolvePackageName(from: documentation.id) ?? .core
    }

    public static func resolvePackageName(from identifier: String) -> PackageName? {
        PackageName.resolvePackageName(from: identifier)
    }

    /**
     Resolves a schema documentation page from its Apple URL.

     - Parameters:
       - docsUrl: The schema URL from the OpenAPI specification.
       - kind: The normalized documentation kind expected by the caller.
     */
    public func resolveDocumentationForSchema(withDocsUrl docsUrl: String?, as kind: DocumentationKind) async throws -> Documentation? {
        guard let docsUrl else { return nil }
        return try await resolveDocumentation(at: docsUrl, as: kind)
    }

    /// Resolves an operation documentation page from its OpenAPI path and operation.
    public func resolveDocumentationForOperation(_ operation: BagbutikSpecDecoder.Operation, in path: Path) async throws -> OperationDocumentation? {
        if let documentation = injectedOperationDocumentationById[operation.id] {
            return documentation
        }
        let url = DocsFetcher.documentationURL(for: operation, in: path)
        guard case .operation(let documentation) = try await resolveDocumentation(at: url.absoluteString, as: .operation) else {
            return nil
        }
        return documentation
    }

    private func resolveDocumentation(at sourceURL: String, as kind: DocumentationKind) async throws -> Documentation? {
        if let documentation = injectedDocumentationById[sourceURL] ?? injectedDocumentationById[sourceURL.lowercased()] {
            return documentation
        }
        guard let documentationDirURL else {
            if allowsMissingDocumentationWithoutLoad { return nil }
            throw DocsLoaderError.documentationNotLoaded
        }
        guard let documentationURL = DocsFetcher.documentationURL(from: sourceURL) else { return nil }
        let key = "\(kind)|\(documentationURL.absoluteString)"
        if let documentation = documentationByKey[key] { return documentation }
        let localURL = DocsFetcher.localURL(for: documentationURL, in: documentationDirURL)
        guard (try? localURL.resourceValues(forKeys: [.isRegularFileKey]).isRegularFile) == true else {
            return nil
        }
        let documentation = try MarkdownDocumentation.parse(await loadFile(localURL), as: kind)
        documentationByKey[key] = documentation
        return documentation
    }
}
