import BagbutikSpecDecoder
import Foundation

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
internal typealias LoadSpec = (_ fileUrl: URL) throws -> Spec

public enum DocsFilename: String {
    case mapping = "SchemaIndex.json"
    case documentation = "Documentation.json"

    var filename: String { rawValue }
}

public class DocsFetcher {
    private let loadSpec: LoadSpec
    private let fileManager: TestableFileManager
    private let print: (String) -> Void

    /// Initialize a new generator
    public convenience init() {
        let loadSpec: LoadSpec = { fileUrl in
            let specData = try Data(contentsOf: fileUrl)
            var spec = try JSONDecoder().decode(Spec.self, from: specData)
            try spec.applyAllFixups()
            return spec
        }
        self.init(loadSpec: loadSpec, fileManager: FileManager.default, print: { Swift.print($0) })
    }

    internal init(loadSpec: @escaping LoadSpec, fileManager: TestableFileManager, print: @escaping (String) -> Void) {
        self.loadSpec = loadSpec
        self.fileManager = fileManager
        self.print = print
    }

    public func fetchAllDocs(specFileURL: URL, outputDirURL: URL) async throws {
        guard specFileURL.isFileURL else { throw DocsFetcherError.notFileUrl(.specFileURL) }
        print("🔍 Loading spec \(specFileURL)...")
        let spec = try loadSpec(specFileURL)

        var identifierBySchemaName = [String: String]()
        var documentationById = [String: Documentation]()
        for schema in spec.components.schemas.sorted(using: KeyPathComparator(\.key)).map(\.value) {
            print("Fetching documentation for \(schema.name)")
            let documentation = try await fetchDocumentation(for: schema)
            identifierBySchemaName[schema.name] = documentation.id
            documentationById[documentation.id] = documentation

            let documentationIdNotFetched: (String) -> Bool = { documentationId in
                !documentationById.keys.contains(where: { $0 == documentationId })
            }
            let documentationIdsToFetch = documentation.subDocumentationIds.filter(documentationIdNotFetched)
            try await fetchDocumentation(
                for: documentationIdsToFetch,
                documentationIdNotFetched: documentationIdNotFetched,
                didFetchDocumentation: { subDocumentation in
                    documentationById[subDocumentation.id] = subDocumentation
                })
        }
        try fileManager.createDirectory(at: outputDirURL, withIntermediateDirectories: true, attributes: nil)
        let documentationFileUrl = outputDirURL.appendingPathComponent(DocsFilename.documentation.filename)
        let schemaIndexFileUrl = outputDirURL.appendingPathComponent(DocsFilename.mapping.filename)
        print("Saving documentation to: \(documentationFileUrl.path)")
        print("Saving schema mapping to: \(schemaIndexFileUrl.path)")
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        guard fileManager.createFile(atPath: documentationFileUrl.path, contents: try encoder.encode(documentationById), attributes: nil),
              fileManager.createFile(atPath: schemaIndexFileUrl.path, contents: try encoder.encode(identifierBySchemaName), attributes: nil)
        else {
            throw DocsFetcherError.couldNotCreateFile
        }
    }

    private func fetchDocumentation(for schema: Schema) async throws -> Documentation {
        guard let urlString = schema.url else {
            throw DocsFetcherError.noDocumentationUrl(schema.name)
        }
        let jsonUrl = createJsonDocumentationUrl(fromUrl: urlString)
        return try await fetchDocumentation(for: jsonUrl)
    }

    private func fetchDocumentation(for documentationIds: [String],
                                    documentationIdNotFetched: (String) -> Bool,
                                    didFetchDocumentation: (Documentation) -> Void) async throws {
        for documentationId in documentationIds {
            let jsonUrl = createJsonDocumentationUrl(fromId: documentationId)
            let documentation = try await fetchDocumentation(for: jsonUrl)
            didFetchDocumentation(documentation)
            try await fetchDocumentation(
                for: documentation.subDocumentationIds.filter { $0 != documentationId }.filter(documentationIdNotFetched),
                documentationIdNotFetched: documentationIdNotFetched,
                didFetchDocumentation: didFetchDocumentation)
        }
    }

    private func fetchDocumentation(for url: URL) async throws -> Documentation {
        print("Fetching JSON from: \(url)")
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Documentation.self, from: data)
    }

    private func createJsonDocumentationUrl(fromUrl url: String) -> URL {
        URL(string: url
            .replacingOccurrences(
                of: "/documentation/",
                with: "/tutorials/data/documentation/")
            .appending(".json"))!
    }

    private func createJsonDocumentationUrl(fromId id: String) -> URL {
        URL(string: id
            .replacingOccurrences(
                of: "doc://com.apple.documentation/documentation",
                with: "https://developer.apple.com/tutorials/data/documentation")
            .appending(".json"))!
    }
}
