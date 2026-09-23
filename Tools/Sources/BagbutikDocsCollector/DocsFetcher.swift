import BagbutikSpecDecoder
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// Errors that can occur while downloading and mirroring Apple Markdown documentation.
public enum DocsFetcherError: Error, Equatable {
    /// The URL is not a file URL.
    case notFileUrl(FileURLType)
    /// A schema does not declare a documentation URL.
    case noDocumentationUrl(String)
    /// The local Markdown file could not be created.
    case couldNotCreateFile

    /// Identifies a file URL argument.
    public enum FileURLType: Sendable {
        /// The local OpenAPI specification file.
        case specFileURL
        /// The local Markdown mirror directory.
        case outputDirURL
    }
}

typealias LoadSpec = (_ fileUrl: URL) throws -> Spec

/**
 The async download closure used by ``DocsFetcher``.

 Supply a custom implementation in tests to avoid contacting Apple.
 */
public typealias FetchData = (_ url: URL, _ delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)

private final class UnsafeSendableBox<Value>: @unchecked Sendable {
    let value: Value

    init(_ value: Value) {
        self.value = value
    }
}

/// Downloads Apple Markdown documentation into a local mirror.
public class DocsFetcher {
    private let loadSpec: LoadSpec
    private let fetchData: FetchData
    private let fileManager: TestableFileManager
    private let print: (String) -> Void

    /// Creates a fetcher with the default specification loader and URL session transport.
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

    init(loadSpec: @escaping LoadSpec, fetchData: @escaping FetchData = URLSession.shared.data(from:delegate:), fileManager: TestableFileManager = FileManager.default, print: @escaping (String) -> Void = { Swift.print($0) }) {
        self.loadSpec = loadSpec
        self.fetchData = fetchData
        self.fileManager = fileManager
        self.print = print
    }

    /**
     Fetches each operation and schema page referenced by an OpenAPI specification.

     - Parameters:
       - specFileURL: The local OpenAPI specification to inspect.
       - outputDirURL: The directory that receives the Markdown mirror.
       - dryRun: When `true`, reports pages without downloading or writing them.
     */
    public func fetchAllDocs(specFileURL: URL, outputDirURL: URL, dryRun: Bool) async throws {
        guard specFileURL.isFileURL else { throw DocsFetcherError.notFileUrl(.specFileURL) }
        guard outputDirURL.isFileURL else { throw DocsFetcherError.notFileUrl(.outputDirURL) }
        print("🔍 Loading spec \(specFileURL.path)...")
        let spec = try loadSpec(specFileURL)
        var pages = [URL: String]()

        for path in spec.paths.values {
            for operation in path.operations {
                let url = Self.documentationURL(for: operation, in: path)
                pages[url] = "operation '\(operation.id)'"
            }
        }
        for schema in spec.components.schemas.values {
            guard let urlString = schema.url else { throw DocsFetcherError.noDocumentationUrl(schema.name) }
            guard let url = Self.documentationURL(from: urlString) else { throw DocsFetcherError.noDocumentationUrl(schema.name) }
            pages[url] = "schema '\(schema.name)'"
        }

        let sortedPages = pages.sorted(by: { $0.key.absoluteString < $1.key.absoluteString })
        if dryRun {
            for (url, context) in sortedPages {
                print("Would fetch documentation for \(context) (\(url))")
            }
            return
        }

        let fetchData = UnsafeSendableBox(fetchData)
        for batchStart in stride(from: 0, to: sortedPages.count, by: 32) {
            let batchEnd = min(batchStart + 32, sortedPages.count)
            let batch = sortedPages[batchStart..<batchEnd]
            let downloadedPages = try await withThrowingTaskGroup(of: (URL, String, Data).self, returning: [(URL, String, Data)].self) { taskGroup in
                for (url, context) in batch {
                    taskGroup.addTask {
                        let (data, _) = try await fetchData.value(url, nil)
                        return (url, context, data)
                    }
                }
                var downloadedPages = [(URL, String, Data)]()
                for try await page in taskGroup {
                    downloadedPages.append(page)
                }
                return downloadedPages
            }
            for (url, context, data) in downloadedPages.sorted(by: { $0.0.absoluteString < $1.0.absoluteString }) {
                let destination = Self.localURL(for: url, in: outputDirURL)
                print("Fetching documentation for \(context) (\(url))")
                try fileManager.createDirectory(at: destination.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: nil)
                guard fileManager.createFile(atPath: destination.path, contents: data, attributes: nil) else {
                    throw DocsFetcherError.couldNotCreateFile
                }
            }
        }
    }

    public static func documentationURL(from url: String) -> URL? {
        guard var components = URLComponents(string: url) else { return nil }
        if !components.path.hasSuffix(".md") {
            components.path += ".md"
        }
        return components.url
    }

    public static func documentationURL(for operation: BagbutikSpecDecoder.Operation, in path: Path) -> URL {
        URL(string: "https://developer.apple.com/documentation/AppStoreConnectAPI/\(operation.getDocumentationId(path: path)).md")!
    }

    static func localURL(for documentationURL: URL, in outputDirURL: URL) -> URL {
        documentationURL.pathComponents
            .dropFirst(3)
            .reduce(outputDirURL) { partialResult, component in
                partialResult.appendingPathComponent(component)
            }
    }
}
