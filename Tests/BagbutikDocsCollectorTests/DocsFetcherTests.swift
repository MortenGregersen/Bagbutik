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
            .init(id: "users-get_collection",
                  name: "listUsers",
                  method: .get,
                  successResponseType: "UsersResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
        "/v1/users/{id}/relationships/visibleApps": Path(path: "/v2/users/{id}/relationships/visibleApps", info: .init(mainType: "Users", version: "V2", isRelationship: true), operations: [
            .init(id: "users-visibleApps-get_to_many_relationship",
                  name: "listVisibleAppIdsForUser",
                  method: .get,
                  successResponseType: "UserVisibleAppsLinkagesResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
    ],
    components: .init(schemas: [
        "UsersResponse": .object(.init(name: "UsersResponse", url: "https://developer.apple.com/documentation/appstoreconnectapi/usersresponse", properties: ["users": .init(type: .arrayOfSchemaRef("User"))])),
        "Platform": .enum(.init(name: "Platform", type: "String", url: "https://developer.apple.com/documentation/appstoreconnectapi/platform", caseValues: ["MAC_OS", "IOS"]))
    ]))
    
    func testFetchAllDocsSimple() async throws {
        // Given
        let fileManager = MockFileManager()
        let urlSession = MockURLSession()
        let printer = Printer()
        let docsFetcher = DocsFetcher(loadSpec: { _ in self.testSpec },
                                      fetchData: urlSession.data(from:delegate:),
                                      fileManager: fileManager,
                                      print: printer.print)
        urlSession.dataByUrl[URL(string: "https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/list_users.json")!] =
            try jsonEncoder.encode(Documentation.operation(.init(
                id: "doc://com.apple.documentation/documentation/appstoreconnectapi/list_users",
                title: "List Users",
                abstract: "Get a list of the users on your team.",
                queryParameters: ["fields[apps]": "Fields to return for included related types."],
                responses: [.init(status: 200, reason: "OK"),
                            .init(status: 400, reason: "Bad Request", description: "An error occurred with your request.")])))
        urlSession.dataByUrl[URL(string: "https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/get_all_visible_app_resource_ids_for_a_user.json")!] =
            try jsonEncoder.encode(Documentation.operation(.init(
                id: "doc://com.apple.documentation/documentation/appstoreconnectapi/get_all_visible_app_resource_ids_for_a_user",
                title: "Get All Visible App Resource IDs for a User",
                abstract: "Get a list of app resource IDs to which a user on your team has access.",
                pathParameters: ["id": "An opaque resource ID that uniquely identifies the resource."],
                queryParameters: ["limit": "Number of resources to return."],
                responses: [.init(status: 200, reason: "OK"),
                            .init(status: 400, reason: "Bad Request", description: "An error occurred with your request.")])))
        urlSession.dataByUrl[URL(string: "https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/usersresponse.json")!] = """
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
                        "doc://com.apple.documentation/documentation/appstoreconnectapi",
                        "doc://com.apple.documentation/documentation/appstoreconnectapi/users"
                    ]
                ]
            },
            "identifier": {
                "url": "doc://com.apple.documentation/documentation/appstoreconnectapi/usersresponse",
            },
            "metadata": {
                "title": "UsersResponse",
                "symbolKind": "dict"
            },
            "references": {
                "doc://com.apple.documentation/documentation/appstoreconnectapi/user": {
                    "title": "User",
                    "type": "topic",
                    "identifier": "doc://com.apple.documentation/documentation/appstoreconnectapi/user",
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
                                    "identifier": "doc://com.apple.documentation/documentation/appstoreconnectapi/user",
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
        urlSession.dataByUrl[URL(string: "https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/platform.json")!] =
            try jsonEncoder.encode(Documentation.enum(.init(
                id: "doc://com.apple.documentation/documentation/appstoreconnectapi/platform",
                title: "Platform",
                abstract: "A response that contains a list of Users resources.",
                cases: ["MACOS": "macOS", "IOS": "iOS"])))
        urlSession.dataByUrl[URL(string: "https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/user.json")!] =
            try jsonEncoder.encode(Documentation.object(.init(
                id: "doc://com.apple.documentation/documentation/appstoreconnectapi/user",
                title: "User",
                abstract: "A User.",
                properties: ["name": .init(required: true, description: "The name of the user.")])))
        // When
        try await docsFetcher.fetchAllDocs(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL)
        // Then
        XCTAssertEqual(printer.printedLogs, [
            "🔍 Loading spec /Users/steve/spec.json...",
            "Fetching documentation for operation \'users-get_collection\' (https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/list_users.json)",
            "Fetching documentation for operation \'users-visibleApps-get_to_many_relationship\' (https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/get_all_visible_app_resource_ids_for_a_user.json)",
            "Fetching documentation for schema \'Platform\' (https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/platform.json)",
            "Fetching documentation for schema \'UsersResponse\' (https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/usersresponse.json)",
            "Fetching documentation for sub schema (https://developer.apple.com/tutorials/data/documentation/appstoreconnectapi/user.json)",
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
        await XCTAssertAsyncThrowsError(try await docsFetcher.fetchAllDocs(specFileURL: specFileURL, outputDirURL: outputDirURL)) {
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
        await XCTAssertAsyncThrowsError(try await docsFetcher.fetchAllDocs(specFileURL: specFileURL, outputDirURL: outputDirURL)) {
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
        let printer = Printer()
        let docsFetcher = DocsFetcher(loadSpec: { _ in try Spec(paths: [:], components: .init(schemas: [:])) }, fetchData: urlSession.data(from:delegate:), fileManager: fileManager, print: printer.print)
        // When
        await XCTAssertAsyncThrowsError(try await docsFetcher.fetchAllDocs(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL)) {
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
        await XCTAssertAsyncThrowsError(try await docsFetcher.fetchAllDocs(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL)) {
            // Then
            XCTAssertEqual($0 as? DocsFetcherError, DocsFetcherError.noDocumentationUrl("Platform"))
        }
    }
    
    func testFetchAllDocsUrlMissingForOperation() async throws {
        // Given
        let fileManager = MockFileManager()
        let urlSession = MockURLSession()
        let printer = Printer()
        let docsFetcher = DocsFetcher(
            loadSpec: { _ in try Spec(paths: [
                "/v1/users": Path(path: "/v1/users", info: .init(mainType: "Users", version: "V1", isRelationship: false), operations: [
                    .init(id: "invalid",
                          name: "listUsers",
                          method: .get,
                          successResponseType: "UsersResponse",
                          errorResponseType: "ErrorResponse"),
                ]),
            ], components: .init(schemas: [:]))
            },
            fetchData: urlSession.data(from:delegate:),
            fileManager: fileManager,
            print: printer.print)
        // When
        try await docsFetcher.fetchAllDocs(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL)
        // Then
        XCTAssertEqual(printer.printedLogs, [
            "🔍 Loading spec /Users/steve/spec.json...",
            "⚠️ Documentation URL missing for operation: 'invalid'",
            "Saving operation documentation to: /Users/steve/output/OperationDocumentation.json",
            "Saving schema documentation to: /Users/steve/output/SchemaDocumentation.json",
            "Saving schema mapping to: /Users/steve/output/SchemaIndex.json"
        ])
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
            DispatchQueue.main.async {
                self.directoriesCreated.append(url.lastPathComponent)
            }
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
