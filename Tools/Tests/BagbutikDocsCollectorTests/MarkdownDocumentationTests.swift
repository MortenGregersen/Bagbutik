@testable import BagbutikDocsCollector
@testable import BagbutikSpecDecoder
import XCTest

final class MarkdownDocumentationTests: XCTestCase {
    func testParseOperationKeepsCompleteMarkdownContent() throws {
        let documentation = try MarkdownDocumentation.parse(markdown(title: "List users", identifier: "/documentation/AppStoreConnectAPI/GET-v1-users", body: """
        # List users

        Get a list of users.

        ## Discussion

        Use this endpoint to manage your team. See [`User`](/documentation/AppStoreConnectAPI/User).

        ## See Also

        [Users](/documentation/AppStoreConnectAPI/users)
        """), as: .operation)

        XCTAssertEqual(documentation, .operation(.init(
            id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/GET-v1-users",
            title: "List users",
            content: """
            # List users

            Get a list of users.

            ## Discussion

            Use this endpoint to manage your team. See [`User`](https://developer.apple.com/documentation/AppStoreConnectAPI/User).

            ## See Also

            [Users](https://developer.apple.com/documentation/AppStoreConnectAPI/users)
            """
        )))
    }

    func testParseObjectKeepsCodeBlocks() throws {
        let documentation = try MarkdownDocumentation.parse(markdown(title: "User", identifier: "/documentation/AppStoreConnectAPI/User", body: """
        # User

        A member of your App Store Connect team.

        ```
        object User
        ```
        """), as: .object)

        XCTAssertEqual(documentation, .object(.init(
            id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/User",
            title: "User",
            content: """
            # User

            A member of your App Store Connect team.

            ```
            object User
            ```
            """
        )))
    }

    func testParseRejectsMissingMetadata() {
        XCTAssertThrowsError(try MarkdownDocumentation.parse(Data("# User".utf8), as: .object)) {
            XCTAssertEqual($0 as? MarkdownDocumentationError, .missingMetadata)
        }
    }

    func testFetcherMirrorsMarkdownAtDocumentationPath() async throws {
        let path = Path(path: "/v1/users", info: .init(mainType: "Users", version: "V1", isRelationship: false), operations: [
            .init(id: "users_getCollection", name: "listUsers", method: .get, successResponseType: "UsersResponse", errorResponseType: "ErrorResponse")
        ])
        let schema = Schema.object(.init(name: "UsersResponse", url: "https://developer.apple.com/documentation/AppStoreConnectAPI/usersresponse", properties: [:]))
        let spec = try Spec(paths: ["/v1/users": path], components: .init(schemas: ["UsersResponse": schema]))
        let fileManager = MockFileManager()
        let fetcher = DocsFetcher(loadSpec: { _ in spec }, fetchData: { url, _ in
            (self.markdown(title: "Page", identifier: "/documentation/AppStoreConnectAPI/Page", body: "# Page"), HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!)
        }, fileManager: fileManager)

        try await fetcher.fetchAllDocs(specFileURL: URL(fileURLWithPath: "/tmp/spec.json"), outputDirURL: URL(fileURLWithPath: "/tmp/Documentation"), dryRun: false)

        XCTAssertEqual(fileManager.createdFiles.sorted(), [
            "/tmp/Documentation/get-v1-users.md",
            "/tmp/Documentation/usersresponse.md"
        ])
    }

    private func markdown(title: String, identifier: String, body: String) -> Data {
        Data("<!--\n{\"identifier\": \"\(identifier)\", \"title\": \"\(title)\"}\n-->\n\(body)".utf8)
    }

    private final class MockFileManager: TestableFileManager {
        var createdFiles = [String]()

        func createDirectory(at url: URL, withIntermediateDirectories: Bool, attributes: [FileAttributeKey: Any]?) throws {}
        func createFile(atPath path: String, contents: Data?, attributes: [FileAttributeKey: Any]?) -> Bool {
            createdFiles.append(path)
            return true
        }
        func fileExists(atPath path: String) -> Bool { true }
        func contentsOfDirectory(at url: URL) throws -> [URL] { [] }
        func removeItem(at url: URL) throws {}
    }
}
