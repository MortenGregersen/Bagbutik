@testable import BagbutikDocsCollector
@testable import BagbutikSpecDecoder
import XCTest
#if canImport(FoundationNetworking)
    // Linux support
    import FoundationNetworking
#endif

final class DocsFetcherTests: XCTestCase {
    let validSpecFileURL = URL(fileURLWithPath: "/Users/steve/spec.json")
    let validOutputDirURL = URL(fileURLWithPath: "/Users/steve/output")
    let validDocumentationDirURL = URL(fileURLWithPath: "/Users/steve/documentation")
    let jsonEncoder = JSONEncoder()
    let testSpec = try! Spec(paths: [
        "/v1/users": Path(path: "/v1/users", info: .init(mainType: "Users", version: "V1", isRelationship: false), operations: [
            .init(id: "users_getCollection",
                  name: "listUsers",
                  method: .get,
                  successResponseType: "UsersResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
        "/v1/users/{id}/relationships/visibleApps": Path(path: "/v2/users/{id}/relationships/visibleApps", info: .init(mainType: "Users", version: "V2", isRelationship: true), operations: [
            .init(id: "users_visibleApps_getToManyRelationship",
                  name: "listVisibleAppIdsForUser",
                  method: .get,
                  successResponseType: "UserVisibleAppsLinkagesResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
    ],
    components: .init(schemas: [
        "UsersResponse": .object(.init(name: "UsersResponse", url: "https://developer.apple.com/documentation/AppStoreConnectAPI/usersresponse", properties: ["users": .init(type: .arrayOfSchemaRef("User"))])),
        "Platform": .enum(.init(name: "Platform", type: "String", url: "https://developer.apple.com/documentation/AppStoreConnectAPI/platform", caseValues: ["MAC_OS", "IOS"]))
    ]))
    
    func testFetchAllDocsSimple() async throws {
        // Given
        let fileManager = MockFileManager()
        let urlSession = MockURLSession()
        #if compiler(<6.0)
        let printer = await Printer()
        #else
        let printer = Printer()
        #endif
        let docsFetcher = DocsFetcher(loadSpec: { _ in self.testSpec },
                                      fetchData: urlSession.data(from:delegate:),
                                      fileManager: fileManager,
                                      print: printer.print)
        urlSession.dataByUrl[URL(string: "https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/get-v1-users.json")!] =
            try jsonEncoder.encode(Documentation.operation(.init(
                id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/list_users",
                title: "List Users",
                abstract: "Get a list of the users on your team.",
                queryParameters: ["fields[apps]": "Fields to return for included related types."],
                responses: [.init(status: 200, reason: "OK"),
                            .init(status: 400, reason: "Bad Request", description: "An error occurred with your request.")])))
        urlSession.dataByUrl[URL(string: "https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/get-v2-users-_id_-relationships-visibleApps.json")!] =
            try jsonEncoder.encode(Documentation.operation(.init(
                id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/get_all_visible_app_resource_ids_for_a_user",
                title: "Get All Visible App Resource IDs for a User",
                abstract: "Get a list of app resource IDs to which a user on your team has access.",
                pathParameters: ["id": "An opaque resource ID that uniquely identifies the resource."],
                queryParameters: ["limit": "Number of resources to return."],
                responses: [.init(status: 200, reason: "OK"),
                            .init(status: 400, reason: "Bad Request", description: "An error occurred with your request.")])))
        urlSession.dataByUrl[URL(string: "https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/usersresponse.json")!] = """
        {
            "abstract": [
                {
                    "type": "text",
                    "text": "A response that contains a list of Users resources."
                }
            ],
            "hierarchy": {
                "paths": [
                    [
                        "doc://com.apple.documentation/documentation/technologies",
                        "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI",
                        "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/users"
                    ]
                ]
            },
            "identifier": {
                "url": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/usersresponse",
            },
            "metadata": {
                "title": "UsersResponse",
                "symbolKind": "dictionary"
            },
            "references": {
                "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user": {
                    "title": "User",
                    "type": "topic",
                    "identifier": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user",
                    "kind": "symbol",
                    "role": "dictionarySymbol",
                    "url": "/documentation/appstoreconnectapi/user",
                    "abstract": [
                        {
                            "type": "text",
                            "text": "The data structure that represents a Users resource."
                        }
                    ],
                    "fragments": [
                        {
                            "kind": "text",
                            "text": "object "
                        },
                        {
                            "kind": "identifier",
                            "text": "User"
                        }
                    ]
                }
            },
            "primaryContentSections": [
                {
                    "title": "Properties",
                    "kind": "properties",
                    "items": [
                        {
                            "name": "data",
                            "type": [
                                {
                                    "kind": "text",
                                    "text": "["
                                },
                                {
                                    "kind": "typeIdentifier",
                                    "preciseIdentifier": "data:app_store_connect_api:User",
                                    "identifier": "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user",
                                    "text": "User"
                                },
                                {
                                    "kind": "text",
                                    "text": "]"
                                }
                            ],
                            "content": [
                                {
                                    "type": "paragraph",
                                    "inlineContent": [
                                        {
                                            "type": "text",
                                            "text": "The resource data."
                                        }
                                    ]
                                }
                            ],
                            "required": true
                        }
                    ]
                }
            ]
        }
        """.data(using: .utf8)
        urlSession.dataByUrl[URL(string: "https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/platform.json")!] =
            try jsonEncoder.encode(Documentation.enum(.init(
                id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/platform",
                hierarchy: .init(paths: []),
                title: "Platform",
                abstract: "A response that contains a list of Users resources.",
                cases: ["MACOS": "macOS", "IOS": "iOS"])))
        urlSession.dataByUrl[URL(string: "https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/user.json")!] =
            try jsonEncoder.encode(Documentation.object(.init(
                id: "doc://com.apple.appstoreconnectapi/documentation/AppStoreConnectAPI/user",
                title: "User",
                abstract: "A User.",
                properties: ["name": .init(required: true, description: "The name of the user.")])))
        // When
        try await docsFetcher.fetchAllDocs(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, dryRun: false)
        // Then
        XCTAssertEqual(printer.printedLogs, [
            "🔍 Loading spec /Users/steve/spec.json...",
            "Fetching documentation for operation \'users_getCollection\' (https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/get-v1-users.json)",
            "Fetching documentation for operation \'users_visibleApps_getToManyRelationship\' (https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/get-v2-users-_id_-relationships-visibleApps.json)",
            "Fetching documentation for schema \'Platform\' (https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/platform.json)",
            "Fetching documentation for schema \'UsersResponse\' (https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/usersresponse.json)",
            "Fetching documentation for sub schema (https://developer.apple.com/tutorials/data/documentation/AppStoreConnectAPI/user.json)",
            "Saving operation documentation to: /Users/steve/output/OperationDocumentation.json",
            "Saving schema documentation to: /Users/steve/output/SchemaDocumentation.json",
            "Saving schema mapping to: /Users/steve/output/SchemaIndex.json"
        ])
    }
    
    func testInvalidSpecFileURL() async throws {
        // Given
        let docsFetcher = DocsFetcher()
        // When
        let specFileURL = URL(string: "https://developer.apple.com")!
        let outputDirURL = validOutputDirURL
        await XCTAssertAsyncThrowsError(try await docsFetcher.fetchAllDocs(specFileURL: specFileURL, outputDirURL: outputDirURL, dryRun: false)) {
            // Then
            XCTAssertEqual($0 as? DocsFetcherError, DocsFetcherError.notFileUrl(.specFileURL))
        }
    }
    
    func testUnloadableSpecFileURL() async throws {
        // Given
        let docsFetcher = DocsFetcher()
        // When
        let specFileURL = URL(fileURLWithPath: "/Users/timcook/app-store-connect-openapi-spec.json")
        let outputDirURL = validOutputDirURL
        await XCTAssertAsyncThrowsError(try await docsFetcher.fetchAllDocs(specFileURL: specFileURL, outputDirURL: outputDirURL, dryRun: false)) {
            // Then
            let nsError = $0 as NSError
            #if os(Linux) && compiler(<6.0)
                XCTAssertEqual(nsError.domain, "NSPOSIXErrorDomain")
                XCTAssertEqual(nsError.code, 2)
            #else
                XCTAssertEqual(nsError.domain, "NSCocoaErrorDomain")
                XCTAssertEqual(nsError.code, 260)
            #endif
        }
    }
    
    func testFailedCreatingFiles() async throws {
        // Given
        let urlSession = MockURLSession()
        let fileManager = MockFileManager()
        fileManager.fileNameToFailCreating = DocsFilename.operationDocumentation.filename
        #if compiler(<6.0)
        let printer = await Printer()
        #else
        let printer = Printer()
        #endif
        let docsFetcher = DocsFetcher(loadSpec: { _ in try Spec(paths: [:], components: .init(schemas: [:])) }, fetchData: urlSession.data(from:delegate:), fileManager: fileManager, print: printer.print)
        // When
        await XCTAssertAsyncThrowsError(try await docsFetcher.fetchAllDocs(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, dryRun: false)) {
            // Then
            XCTAssertEqual($0 as? DocsFetcherError, DocsFetcherError.couldNotCreateFile)
        }
    }
    
    func testFetchAllDocsMissingForSchema() async throws {
        // Given
        let docsFetcher = DocsFetcher(
            loadSpec: { _ in try Spec(paths: [:], components: .init(schemas: [
                "Platform": .enum(.init(name: "Platform", type: "String", url: nil, caseValues: []))
            ]))
            })
        // When
        await XCTAssertAsyncThrowsError(try await docsFetcher.fetchAllDocs(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, dryRun: false)) {
            // Then
            XCTAssertEqual($0 as? DocsFetcherError, DocsFetcherError.noDocumentationUrl("Platform"))
        }
    }
    
    class MockURLSession {
        var dataByUrl: [URL: Data] = [:]
        
        func data(from url: URL, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
            let data = dataByUrl[url]!
            return (data, HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!)
        }
    }
    
    private class MockFileManager: TestableFileManager {
        var directoriesCreated = [String]()
        var filesCreated = [(name: String, data: Data)]()
        var itemsRemoved = [String]()
        var fileNameToFailCreating: String?
        
        func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey: Any]?) throws {
            self.directoriesCreated.append(url.lastPathComponent)
        }
        
        func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey: Any]?) -> Bool {
            let fileName = path.components(separatedBy: "/").last!
            guard fileName != fileNameToFailCreating else { return false }
            filesCreated.append((name: fileName, data: data!))
            return true
        }
        
        func fileExists(atPath path: String) -> Bool {
            true
        }
        
        func removeItem(at URL: URL) throws {
            itemsRemoved.append(URL.lastPathComponent)
        }
    }
    
    private class Printer {
        private(set) var printedLogs = [String]()
        
        func print(string: String) {
            printedLogs.append(string)
        }
    }
}
