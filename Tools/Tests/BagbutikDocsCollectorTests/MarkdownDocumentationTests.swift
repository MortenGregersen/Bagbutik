@testable import BagbutikDocsCollector
@testable import BagbutikSpecDecoder
import XCTest
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

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

    func testParseRejectsInvalidAndUnsupportedMetadata() {
        XCTAssertThrowsError(try MarkdownDocumentation.parse(Data("<!-- invalid -->\n# User".utf8), as: .object)) {
            XCTAssertEqual($0 as? MarkdownDocumentationError, .invalidMetadata)
        }
        XCTAssertThrowsError(try MarkdownDocumentation.parse(markdown(title: "User", identifier: "https://example.com/User", body: "# User"), as: .object)) {
            XCTAssertEqual($0 as? MarkdownDocumentationError, .unsupportedIdentifier("https://example.com/User"))
        }
    }

    func testDocumentationURLsAndMirrorPaths() {
        XCTAssertEqual(
            DocsFetcher.documentationURL(from: "https://developer.apple.com/documentation/AppStoreConnectAPI/users")?.absoluteString,
            "https://developer.apple.com/documentation/AppStoreConnectAPI/users.md"
        )
        XCTAssertEqual(
            DocsFetcher.documentationURL(from: "https://developer.apple.com/documentation/AppStoreConnectAPI/users.md")?.absoluteString,
            "https://developer.apple.com/documentation/AppStoreConnectAPI/users.md"
        )
        let documentationURL = URL(string: "https://developer.apple.com/documentation/AppStoreConnectAPI/User/visibleApps.md")!
        XCTAssertEqual(
            DocsFetcher.localURL(for: documentationURL, in: URL(fileURLWithPath: "/tmp/Documentation")).path,
            "/tmp/Documentation/User/visibleApps.md"
        )
    }

    func testFetcherDryRunDoesNotDownloadOrWriteFiles() async throws {
        let path = Path(path: "/v1/users", info: .init(mainType: "Users", version: "V1", isRelationship: false), operations: [
            .init(id: "users_getCollection", name: "listUsers", method: .get, successResponseType: "UsersResponse", errorResponseType: "ErrorResponse")
        ])
        let schema = Schema.object(.init(name: "UsersResponse", url: "https://developer.apple.com/documentation/AppStoreConnectAPI/usersresponse", properties: [:]))
        let spec = try Spec(paths: ["/v1/users": path], components: .init(schemas: ["UsersResponse": schema]))
        let fileManager = MockFileManager()
        let fetcher = DocsFetcher(loadSpec: { _ in spec }, fetchData: { _, _ in throw TestError.downloadedDuringDryRun }, fileManager: fileManager)

        try await fetcher.fetchAllDocs(specFileURL: URL(fileURLWithPath: "/tmp/spec.json"), outputDirURL: URL(fileURLWithPath: "/tmp/Documentation"), dryRun: true)

        XCTAssertTrue(fileManager.createdFiles.isEmpty)
    }

    func testFetcherReportsMissingSchemaURLAndFailedWrite() async throws {
        let missingURLSchema = Schema.enum(.init(name: "Platform", type: "String", url: nil, caseValues: []))
        let missingURLFetcher = DocsFetcher(loadSpec: { _ in try Spec(paths: [:], components: .init(schemas: ["Platform": missingURLSchema])) })
        await XCTAssertAsyncThrowsError(try await missingURLFetcher.fetchAllDocs(specFileURL: URL(fileURLWithPath: "/tmp/spec.json"), outputDirURL: URL(fileURLWithPath: "/tmp/Documentation"), dryRun: false)) {
            XCTAssertEqual($0 as? DocsFetcherError, .noDocumentationUrl("Platform"))
        }

        let schema = Schema.object(.init(name: "UsersResponse", url: "https://developer.apple.com/documentation/AppStoreConnectAPI/usersresponse", properties: [:]))
        let fileManager = MockFileManager(shouldFailCreatingFiles: true)
        let failingWriteFetcher = DocsFetcher(loadSpec: { _ in try Spec(paths: [:], components: .init(schemas: ["UsersResponse": schema])) }, fetchData: { url, _ in
            (Data(), HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!)
        }, fileManager: fileManager)
        await XCTAssertAsyncThrowsError(try await failingWriteFetcher.fetchAllDocs(specFileURL: URL(fileURLWithPath: "/tmp/spec.json"), outputDirURL: URL(fileURLWithPath: "/tmp/Documentation"), dryRun: false)) {
            XCTAssertEqual($0 as? DocsFetcherError, .couldNotCreateFile)
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

    private enum TestError: Error {
        case downloadedDuringDryRun
    }

    private final class MockFileManager: TestableFileManager {
        var createdFiles = [String]()
        let shouldFailCreatingFiles: Bool

        init(shouldFailCreatingFiles: Bool = false) {
            self.shouldFailCreatingFiles = shouldFailCreatingFiles
        }

        func createDirectory(at url: URL, withIntermediateDirectories: Bool, attributes: [FileAttributeKey: Any]?) throws {}
        func createFile(atPath path: String, contents: Data?, attributes: [FileAttributeKey: Any]?) -> Bool {
            createdFiles.append(path)
            return !shouldFailCreatingFiles
        }
        func fileExists(atPath path: String) -> Bool { true }
        func contentsOfDirectory(at url: URL) throws -> [URL] { [] }
        func removeItem(at url: URL) throws {}
    }
}
