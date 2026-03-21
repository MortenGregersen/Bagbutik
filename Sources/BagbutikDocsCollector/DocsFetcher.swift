import BagbutikSpecDecoder
import Foundation
#if canImport(FoundationNetworking)
// Non-Apple platform support
import BagbutikPolyfill
import FoundationNetworking
#endif

/// Errors that can occur while downloading and storing Apple documentation JSON.
public enum DocsFetcherError: Error {
    /// The URL is not a file URL
    case notFileUrl(FileURLType)
    /// The schema has no documentation URL
    case noDocumentationUrl(String)
    /// The documentation file could not be created
    case couldNotCreateFile
    /// Decoding failed for one or more documentation files
    case documentationDecodingFailures([DocumentationDecodingFailure])

    /// The type of the file URL
    public enum FileURLType: Sendable {
        /// The URL for the spec file
        case specFileURL
        /// The URL for the output directory
        case outputDirURL
    }
}

extension DocsFetcherError: Equatable {}

/// Describes one documentation payload that could not be decoded.
public struct DocumentationDecodingFailure: Error, Equatable, Sendable {
    public let context: String
    public let url: URL
    public let message: String

    public init(context: String, url: URL, message: String) {
        self.context = context
        self.url = url
        self.message = message
    }
}

/**
 The closure used to load and decode an OpenAPI spec from disk.

 This indirection keeps ``DocsFetcher`` easy to test.

 - Parameter fileUrl: The file URL of the OpenAPI spec.
 - Returns: A decoded ``Spec`` value.
 */
typealias LoadSpec = (_ fileUrl: URL) throws -> Spec

/**
 The async download closure used by ``DocsFetcher``.

 Provide a custom implementation in tests to avoid hitting Apple's documentation endpoints.

 - Parameters:
    - url: The documentation URL to download.
    - delegate: An optional task specific delegate.
 - Returns: The raw response body and URL response.
 */
public typealias FetchData = (_ url: URL, _ delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)

/// Filenames used for the normalized documentation cache stored in `Documentation/`.
public enum DocsFilename: String {
    case schemaMapping = "SchemaIndex.json"
    case schemaDocumentation = "SchemaDocumentation.json"
    case operationDocumentation = "OperationDocumentation.json"

    public var filename: String { rawValue }
}

/// Downloads Apple's documentation JSON and stores it in Bagbutik's normalized local format.
public class DocsFetcher {
    private let loadSpec: LoadSpec
    private let fetchData: FetchData
    private let fileManager: TestableFileManager
    private let print: (String) -> Void

    /// Creates a fetcher configured with the default spec loader and `URLSession` transport.
    public convenience init() {
        let loadSpec: LoadSpec = { fileUrl in
            let specData = try Data(contentsOf: fileUrl)
            var spec = try JSONDecoder().decode(Spec.self, from: specData)
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

    /**
     Fetches documentation for every schema and operation referenced by the supplied spec.

     The fetched data is normalized into the JSON files consumed later by ``DocsLoader`` and
     the code generator.

     - Parameters:
        - specFileURL: The local OpenAPI spec to inspect for schema and operation identifiers.
        - outputDirURL: The directory where the normalized documentation files should be written.
        - dryRun: When `true`, log the work that would be performed without making network requests.
     */
    public func fetchAllDocs(specFileURL: URL, outputDirURL: URL, dryRun: Bool) async throws {
        guard specFileURL.isFileURL else { throw DocsFetcherError.notFileUrl(.specFileURL) }
        print("🔍 Loading spec \(specFileURL.path)...")
        let spec = try loadSpec(specFileURL)
        var documentationDecodingFailures = [DocumentationDecodingFailure]()

        var operationDocumentationById = [String: Documentation]()
        let operationIdsAndDocUrls: [(operationId: String, docUrl: URL)] = spec.paths.values
            .flatMap { path in
                path.operations.map {
                    (operationId: $0.id, docUrl: createJsonDocumentationUrl(fromOperation: $0, in: path))
                }
            }
            .sorted(by: { $0.operationId < $1.operationId })
        for (operationId, docUrl) in operationIdsAndDocUrls {
            if dryRun {
                print("Would fetch documentation for operation '\(operationId)' (\(docUrl))")
            } else {
                print("Fetching documentation for operation '\(operationId)' (\(docUrl))")
                do {
                    let documentation = try await fetchDocumentation(for: docUrl)
                    operationDocumentationById[operationId] = documentation
                } catch {
                    documentationDecodingFailures.append(.init(context: "operation '\(operationId)'", url: docUrl, message: String(describing: error)))
                }
            }
        }

        var identifierBySchemaName = [String: String]()
        var schemaDocumentationById = [String: Documentation]()
        for schema in spec.components.schemas.sorted(by: { $0.key < $1.key }).map(\.value) {
            let jsonUrl = try createJsonDocumentationUrl(for: schema)
            print("Fetching documentation for schema '\(schema.name)' (\(jsonUrl))")
            do {
                let documentation = try await fetchDocumentation(for: jsonUrl)
                identifierBySchemaName[schema.name] = documentation.id
                schemaDocumentationById[documentation.id] = documentation

                let documentationIdNotFetched: (String) -> Bool = { documentationId in
                    !schemaDocumentationById.keys.contains(where: { $0 == documentationId })
                }
                let documentationIdsToFetch = documentation.subDocumentationIds.filter(documentationIdNotFetched)
                await fetchDocumentation(
                    for: documentationIdsToFetch,
                    documentationIdNotFetched: documentationIdNotFetched,
                    didFetchDocumentation: { subDocumentation in
                        schemaDocumentationById[subDocumentation.id] = subDocumentation
                    },
                    documentationDecodingFailures: &documentationDecodingFailures)
            } catch {
                documentationDecodingFailures.append(.init(context: "schema '\(schema.name)'", url: jsonUrl, message: String(describing: error)))
            }
        }
        if !documentationDecodingFailures.isEmpty {
            print("Found \(documentationDecodingFailures.count) documentation decoding errors:")
            for decodingFailure in documentationDecodingFailures {
                print(" - \(decodingFailure.context): \(decodingFailure.url)")
                print("   \(decodingFailure.message)")
            }
            throw DocsFetcherError.documentationDecodingFailures(documentationDecodingFailures)
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

    private func fetchDocumentation(for documentationIds: [String],
                                    documentationIdNotFetched: (String) -> Bool,
                                    didFetchDocumentation: (Documentation) -> Void,
                                    documentationDecodingFailures: inout [DocumentationDecodingFailure]) async {
        for documentationId in documentationIds {
            let jsonUrl = createJsonDocumentationUrl(fromDocId: documentationId)
            print("Fetching documentation for sub schema (\(jsonUrl))")
            do {
                let documentation = try await fetchDocumentation(for: jsonUrl)
                didFetchDocumentation(documentation)
                await fetchDocumentation(
                    for: documentation.subDocumentationIds.filter { $0 != documentationId }.filter(documentationIdNotFetched),
                    documentationIdNotFetched: documentationIdNotFetched,
                    didFetchDocumentation: didFetchDocumentation,
                    documentationDecodingFailures: &documentationDecodingFailures)
            } catch {
                documentationDecodingFailures.append(.init(context: "sub schema '\(documentationId)'", url: jsonUrl, message: String(describing: error)))
            }
        }
    }

    private func fetchDocumentation(for url: URL) async throws -> Documentation {
        let (data, _) = try await fetchData(url, nil)
        do {
            return try JSONDecoder().decode(Documentation.self, from: data)
        } catch {
            #if os(Linux) || os(Android) || os(Windows)
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

    private func createJsonDocumentationUrl(for schema: Schema) throws -> URL {
        guard let urlString = schema.url else {
            throw DocsFetcherError.noDocumentationUrl(schema.name)
        }
        return createJsonDocumentationUrl(fromUrl: urlString)
    }

    private func createJsonDocumentationUrl(fromDocId id: String) -> URL {
        URL(string: id
            .replacingOccurrences(
                of: "doc://com.apple.appstoreconnectapi/documentation",
                with: "https://developer.apple.com/tutorials/data/documentation")
            .appending(".json"))!
    }

    private func createJsonDocumentationUrl(fromOperation operation: BagbutikSpecDecoder.Operation, in path: Path) -> URL {
        let urlPath = operation.getDocumentationId(path: path).appending(".json")
        return URL(string: "https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/" + urlPath)!
    }
}
