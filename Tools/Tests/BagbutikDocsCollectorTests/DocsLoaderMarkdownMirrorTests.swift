@testable import BagbutikDocsCollector
@testable import BagbutikSpecDecoder
import Foundation
import XCTest

final class DocsLoaderMarkdownMirrorTests: XCTestCase {
    func testLoadsSchemaDocumentationFromMarkdownMirror() async throws {
        let documentationDirectory = try makeDocumentationDirectory()
        defer { try? FileManager.default.removeItem(at: documentationDirectory) }
        let pageURL = documentationDirectory.appendingPathComponent("usersresponse.md")
        try markdown(title: "Users response", identifier: "/documentation/AppStoreConnectAPI/UsersResponse", body: "# Users response\n\nA paginated response.").write(to: pageURL)

        let loader = DocsLoader()
        try await loader.loadDocs(documentationDirURL: documentationDirectory)
        let documentation = try await loader.resolveDocumentationForSchema(
            withDocsUrl: "https://developer.apple.com/documentation/AppStoreConnectAPI/usersresponse",
            as: .object
        )

        XCTAssertEqual(documentation, .object(.init(
            id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/UsersResponse",
            title: "Users response",
            content: "# Users response\n\nA paginated response."
        )))
    }

    func testReturnsNilForMissingOrUnconfiguredDocumentation() async throws {
        let loader = DocsLoader()
        await XCTAssertAsyncThrowsError(try await loader.resolveDocumentationForSchema(withDocsUrl: "https://developer.apple.com/documentation/AppStoreConnectAPI/usersresponse", as: .object)) {
            XCTAssertEqual($0 as? DocsLoaderError, .documentationNotLoaded)
        }

        let documentationDirectory = try makeDocumentationDirectory()
        defer { try? FileManager.default.removeItem(at: documentationDirectory) }
        try await loader.loadDocs(documentationDirURL: documentationDirectory)
        let documentation = try await loader.resolveDocumentationForSchema(withDocsUrl: "https://developer.apple.com/documentation/AppStoreConnectAPI/usersresponse", as: .object)
        XCTAssertNil(documentation)
        let noURLDocumentation = try await loader.resolveDocumentationForSchema(withDocsUrl: nil, as: .object)
        XCTAssertNil(noURLDocumentation)
    }

    private func makeDocumentationDirectory() throws -> URL {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        return directory
    }

    private func markdown(title: String, identifier: String, body: String) -> Data {
        Data("<!--\n{\"identifier\": \"\(identifier)\", \"title\": \"\(title)\"}\n-->\n\(body)".utf8)
    }
}
