import BagbutikSpecDecoder
import Foundation
#if canImport(FoundationNetworking)
// Linux support
import BagbutikPolyfill
import FoundationNetworking
#endif

/// Errors that can occur when fetching docs
public enum DocsFetcherError: Error {
    /// The URL is not a file URL
    case notFileUrl(FileURLType)
    /// The schema has no documentation URL
    case noDocumentationUrl(String)
    /// The documentation file could not be created
    case couldNotCreateFile

    /// The type of the file URL
    public enum FileURLType {
        /// The URL for the spec file
        case specFileURL
        /// The URL for the output directory
        case outputDirURL
    }
}

extension DocsFetcherError: Equatable {}

/**
 An alias for a function loading a spec from a file URL

 - Parameter fileUrl: The file URL to load the spec from
 - Returns: A decoded Spec
 */
typealias LoadSpec = (_ fileUrl: URL) throws -> Spec

/**
 Function used to fetch data for requests.

 Only used to inject into a ``DocsFetcher``.

 - Parameters:
    - request: The URLRequest for which to load data.
    - delegate: Task-specific delegate.
 - Returns: Data and response.
 */
public typealias FetchData = (_ url: URL, _ delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)

public enum DocsFilename: String {
    case schemaMapping = "SchemaIndex.json"
    case schemaDocumentation = "SchemaDocumentation.json"
    case operationDocumentation = "OperationDocumentation.json"

    public var filename: String { rawValue }
}

public class DocsFetcher {
    private let loadSpec: LoadSpec
    private let fetchData: FetchData
    private let fileManager: TestableFileManager
    private let print: (String) -> Void

    /// Initialize a new docs fetcher
    public convenience init() {
        let loadSpec: LoadSpec = { fileUrl in
            let specData = try Data(contentsOf: fileUrl)
            var spec = try JSONDecoder().decode(Spec.self, from: specData)
            spec.addForgottenIncludeParameters()
            spec.flattenIdenticalSchemas()
            try spec.applyManualPatches()
            return spec
        }
        self.init(loadSpec: loadSpec)
    }

    init(
        loadSpec: @escaping LoadSpec,
        fetchData: @escaping FetchData = URLSession.shared.data(from:delegate:),
        fileManager: TestableFileManager = FileManager.default,
        print: @escaping (String) -> Void = { Swift.print($0) }) {
        self.loadSpec = loadSpec
        self.fetchData = fetchData
        self.fileManager = fileManager
        self.print = print
    }

    public func fetchAllDocs(specFileURL: URL, outputDirURL: URL) async throws {
        guard specFileURL.isFileURL else { throw DocsFetcherError.notFileUrl(.specFileURL) }
        print("🔍 Loading spec \(specFileURL)...")
        let spec = try loadSpec(specFileURL)

        var operationDocumentationById = [String: Documentation]()
        let operationIds = spec.paths.values.map(\.operations).flatMap { $0 }.map(\.id).sorted()
        for operationId in operationIds {
            if let operationUrl = createJsonDocumentationUrl(fromOperationId: operationId) {
                print("Fetching documentation for operation '\(operationId)' (\(operationUrl))")
                let documentation = try await fetchDocumentation(for: operationUrl)
                operationDocumentationById[operationId] = documentation
            } else {
                print("⚠️ Documentation URL missing for operation: '\(operationId)'")
            }
        }
        // Comment in to get a list of obsolete URLs
//        let operationIdsWithUrlButNotInSpec = OperationMapping.allMappings.keys.filter { !operationIds.contains($0) }
//        operationIdsWithUrlButNotInSpec.forEach { operationId in
//            print("⚠️ Documentation URL exists for removed operation: '\(operationId)'")
//        }

        var identifierBySchemaName = [String: String]()
        var schemaDocumentationById = [String: Documentation]()
        for schema in spec.components.schemas.sorted(by: { $0.key < $1.key }).map(\.value) {
            let documentation = try await fetchDocumentation(for: schema)
            identifierBySchemaName[schema.name] = documentation.id
            schemaDocumentationById[documentation.id] = documentation

            let documentationIdNotFetched: (String) -> Bool = { documentationId in
                !schemaDocumentationById.keys.contains(where: { $0 == documentationId })
            }
            let documentationIdsToFetch = documentation.subDocumentationIds.filter(documentationIdNotFetched)
            try await fetchDocumentation(
                for: documentationIdsToFetch,
                documentationIdNotFetched: documentationIdNotFetched,
                didFetchDocumentation: { subDocumentation in
                    schemaDocumentationById[subDocumentation.id] = subDocumentation
                })
        }
        try fileManager.createDirectory(at: outputDirURL, withIntermediateDirectories: true, attributes: nil)
        let operationDocumentationFileUrl = outputDirURL.appendingPathComponent(DocsFilename.operationDocumentation.filename)
        let schemaDocumentationFileUrl = outputDirURL.appendingPathComponent(DocsFilename.schemaDocumentation.filename)
        let schemaMappingFileUrl = outputDirURL.appendingPathComponent(DocsFilename.schemaMapping.filename)
        print("Saving operation documentation to: \(operationDocumentationFileUrl.path)")
        print("Saving schema documentation to: \(schemaDocumentationFileUrl.path)")
        print("Saving schema mapping to: \(schemaMappingFileUrl.path)")
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        guard try fileManager.createFile(atPath: operationDocumentationFileUrl.path, contents: encoder.encode(operationDocumentationById), attributes: nil),
              try fileManager.createFile(atPath: schemaDocumentationFileUrl.path, contents: encoder.encode(schemaDocumentationById), attributes: nil),
              try fileManager.createFile(atPath: schemaMappingFileUrl.path, contents: encoder.encode(identifierBySchemaName), attributes: nil)
        else {
            throw DocsFetcherError.couldNotCreateFile
        }
    }

    private func fetchDocumentation(for schema: Schema) async throws -> Documentation {
        guard let urlString = schema.url else {
            throw DocsFetcherError.noDocumentationUrl(schema.name)
        }
        let jsonUrl = createJsonDocumentationUrl(fromUrl: urlString)
        print("Fetching documentation for schema '\(schema.name)' (\(jsonUrl))")
        return try await fetchDocumentation(for: jsonUrl)
    }

    private func fetchDocumentation(for documentationIds: [String],
                                    documentationIdNotFetched: (String) -> Bool,
                                    didFetchDocumentation: (Documentation) -> Void) async throws {
        for documentationId in documentationIds {
            let jsonUrl = createJsonDocumentationUrl(fromDocId: documentationId)
            print("Fetching documentation for sub schema (\(jsonUrl))")
            let documentation = try await fetchDocumentation(for: jsonUrl)
            didFetchDocumentation(documentation)
            try await fetchDocumentation(
                for: documentation.subDocumentationIds.filter { $0 != documentationId }.filter(documentationIdNotFetched),
                documentationIdNotFetched: documentationIdNotFetched,
                didFetchDocumentation: didFetchDocumentation)
        }
    }

    private func fetchDocumentation(for url: URL) async throws -> Documentation {
        let (data, _) = try await fetchData(url, nil)
        do {
            return try JSONDecoder().decode(Documentation.self, from: data)
        } catch {
            #if os(Linux)
            throw error
            #else
            // Sometimes the response contains HTML-like content - probably rate limiting. Try again
            guard let underlyingError = (error as NSError).underlyingErrors.first as? NSError, underlyingError.description.contains("Unexpected character '<'") else {
                throw error
            }
            try await Task.sleep(nanoseconds: 2_000_000_000)
            let (data, _) = try await fetchData(url, nil)
            return try JSONDecoder().decode(Documentation.self, from: data)
            #endif
        }
    }

    private func createJsonDocumentationUrl(fromUrl url: String) -> URL {
        URL(string: url
            .replacingOccurrences(
                of: "/documentation/",
                with: "/tutorials/data/documentation/")
            .appending(".json"))!
    }

    private func createJsonDocumentationUrl(fromDocId id: String) -> URL {
        URL(string: id
            .replacingOccurrences(
                of: "doc://com.apple.documentation/documentation",
                with: "https://developer.apple.com/tutorials/data/documentation")
            .appending(".json"))!
    }

    private func createJsonDocumentationUrl(fromOperationId operationId: String) -> URL? {
        guard let urlPath = OperationMapping.allMappings[operationId]?.appending(".json") else { return nil }
        return URL(string: "https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/" + urlPath)!
    }
}
