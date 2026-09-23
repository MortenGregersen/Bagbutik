@testable import BagbutikDocsCollector
import XCTest

final class DocsLoaderTests: XCTestCase {
    func testLoaderReadsMirroredSchemaMarkdown() async throws {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        defer { try? FileManager.default.removeItem(at: directory) }
        let sourceURL = URL(string: "https://developer.apple.com/documentation/AppStoreConnectAPI/User.md")!
        let fileURL = DocsFetcher.localURL(for: sourceURL, in: directory)
        try FileManager.default.createDirectory(at: fileURL.deletingLastPathComponent(), withIntermediateDirectories: true)
        try Data("<!--\n{\"identifier\": \"/documentation/AppStoreConnectAPI/User\", \"title\": \"User\"}\n-->\n# User\n\nA team member.".utf8).write(to: fileURL)

        let loader = DocsLoader()
        try await loader.loadDocs(documentationDirURL: directory)
        let documentation = try await loader.resolveDocumentationForSchema(withDocsUrl: sourceURL.absoluteString, as: .object)

        XCTAssertEqual(documentation, .object(.init(
            id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/User",
            title: "User",
            content: "# User\n\nA team member."
        )))
    }

    func testLoaderIgnoresDocumentationRootDirectory() async throws {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        defer { try? FileManager.default.removeItem(at: directory) }
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)

        let loader = DocsLoader()
        try await loader.loadDocs(documentationDirURL: directory)
        let documentation = try await loader.resolveDocumentationForSchema(
            withDocsUrl: "https://developer.apple.com/documentation/AppStoreConnectAPI",
            as: .object
        )

        XCTAssertNil(documentation)
    }
}
