@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class GeneratorTests: XCTestCase {
    let validSpecFileURL = URL(fileURLWithPath: "/Users/steve/spec.json")
    let validOutputDirURL = URL(fileURLWithPath: "/Users/steve/output")
    let validDocumentationDirURL = URL(fileURLWithPath: "/Users/steve/documentation")
    let testSpec = try! Spec(paths: [
        "/v1/users": Path(path: "/v1/users", info: .init(mainType: "Users", version: "V1", isRelationship: false), operations: [
            .init(id: "users-get_collection",
                  name: "listUsers",
                  method: .get,
                  successResponseType: "UsersResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
        "/v2/users/{id}/relationships/visibleApps": Path(path: "/v2/users/{id}/relationships/visibleApps", info: .init(mainType: "Users", version: "V2", isRelationship: true), operations: [
            .init(id: "users-visibleApps-get_to_many_relationship",
                  name: "listVisibleAppIdsForUser",
                  method: .get,
                  successResponseType: "UserVisibleAppsLinkagesResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
    ],
    components: .init(schemas: [
        "UsersResponse": .object(.init(name: "UsersResponse", url: "some://url", properties: ["users": .init(type: .arrayOfSchemaRef("User"))])),
        "ReplaceUsersResponse": .enum(.init(name: "ReplaceUsersResponse", type: "String", caseValues: ["none", "some"])),
        "Gzip": .binary(.init(name: "Gzip", url: "other://url")),
        "Csv": .plainText(.init(name: "Csv", url: "other://url")),
    ]))
    lazy var docsLoader = { DocsLoader(loadFile: loadFile) }()
    
    func testGenerateAllSimple() async throws {
        // Given
        let fileManager = MockFileManager()
        let printer = Printer()
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)
        // When
        try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)
        // Then
        continueAfterFailure = false
        XCTAssertEqual(fileManager.itemsRemoved.count, 7)
        XCTAssertEqual(fileManager.itemsRemoved, [
            "/Users/steve/output/Bagbutik-AppStore/Endpoints",
            "/Users/steve/output/Bagbutik-Provisioning/Endpoints",
            "/Users/steve/output/Bagbutik-Reporting/Endpoints",
            "/Users/steve/output/Bagbutik-TestFlight/Endpoints",
            "/Users/steve/output/Bagbutik-Users/Endpoints",
            "/Users/steve/output/Bagbutik-XcodeCloud/Endpoints",
            "/Users/steve/output/Bagbutik-Core/Models",
        ])
        XCTAssertEqual(fileManager.directoriesCreated.count, 9)
        XCTAssertEqual(fileManager.directoriesCreated.sorted(), [
            "/Users/steve/output/Bagbutik-AppStore/Endpoints",
            "/Users/steve/output/Bagbutik-Core/Models",
            "/Users/steve/output/Bagbutik-Provisioning/Endpoints",
            "/Users/steve/output/Bagbutik-Reporting/Endpoints",
            "/Users/steve/output/Bagbutik-TestFlight/Endpoints",
            "/Users/steve/output/Bagbutik-Users/Endpoints",
            "/Users/steve/output/Bagbutik-Users/Endpoints/Users",
            "/Users/steve/output/Bagbutik-Users/Endpoints/Users/Relationships",
            "/Users/steve/output/Bagbutik-XcodeCloud/Endpoints",
        ])
        XCTAssertEqual(fileManager.filesCreated.count, 6)
        XCTAssertEqual(fileManager.filesCreated.map(\.name).sorted(), [
            "Csv.swift",
            "Gzip.swift",
            "ListUsersV1.swift",
            "ListVisibleAppIdsForUserV2.swift",
            "ReplaceUsersResponse.swift",
            "UsersResponse.swift",
        ])
        XCTAssertEqual(printer.printedLogs[0], "🔍 Loading spec file:///Users/steve/spec.json...")
        XCTAssertEqual(printer.printedLogs[1], "🔍 Loading docs file:///Users/steve/documentation...")
        XCTAssertEqual(printer.printedLogs[2 ... 7].sorted(), [
            "⚡️ Generating endpoint ListUsersV1.swift...",
            "⚡️ Generating endpoint ListVisibleAppIdsForUserV2.swift...",
            "⚡️ Generating model Csv...",
            "⚡️ Generating model Gzip...",
            "⚡️ Generating model ReplaceUsersResponse...",
            "⚡️ Generating model UsersResponse...",
        ])
        XCTAssertEqual(printer.printedLogs[8], "🎉 Finished generating 2 endpoints and 4 models! 🎉")
    }
    
    func testInvalidSpecFileURL() async throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = URL(string: "https://developer.apple.com")!
        let outputDirURL = validOutputDirURL
        let documentationDirURL = validDocumentationDirURL
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL, documentationDirURL: documentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, GeneratorError.notFileUrl(.specFileURL))
        }
    }
    
    func testInvalidOutputDirURL() async throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = validSpecFileURL
        let outputDirURL = URL(string: "https://developer.apple.com")!
        let documentationDirURL = validDocumentationDirURL
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL, documentationDirURL: documentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, GeneratorError.notFileUrl(.outputDirURL))
        }
    }
    
    func testInvalidDocumentationDirURL() async throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = validSpecFileURL
        let outputDirURL = validOutputDirURL
        let documentationDirURL = URL(string: "https://developer.apple.com")!
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL, documentationDirURL: documentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, GeneratorError.notFileUrl(.documentationDirUrl))
        }
    }
    
    func testUnloadableSpecFileURL() async throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = URL(fileURLWithPath: "/Users/timcook/app-store-connect-openapi-spec.json")
        let outputDirURL = validOutputDirURL
        let documentationDirURL = validDocumentationDirURL
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL, documentationDirURL: documentationDirURL)) {
            // Then
            let nsError = $0 as NSError
            #if os(Linux)
                XCTAssertEqual(nsError.domain, "NSPOSIXErrorDomain")
                XCTAssertEqual(nsError.code, 2)
            #else
                XCTAssertEqual(nsError.domain, "NSCocoaErrorDomain")
                XCTAssertEqual(nsError.code, 260)
            #endif
        }
    }
    
    func testFailedCreatingEndpoint() async throws {
        // Given
        let fileManager = MockFileManager()
        fileManager.fileNameToFailCreating = "ListUsersV1.swift"
        let printer = Printer()
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)
        // When
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, GeneratorError.couldNotCreateFile("ListUsersV1.swift"))
        }
    }
    
    func testFailedCreatingModel() async throws {
        // Given
        let fileManager = MockFileManager()
        fileManager.fileNameToFailCreating = "UsersResponse.swift"
        let printer = Printer()
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, docsLoader: docsLoader, print: printer.print)
        // When
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL, documentationDirURL: validDocumentationDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, GeneratorError.couldNotCreateFile("UsersResponse.swift"))
        }
    }
    
    private class MockFileManager: TestableFileManager {
        var directoriesCreated = [String]()
        var filesCreated = [(name: String, data: Data)]()
        var itemsRemoved = [String]()
        var fileNameToFailCreating: String?
        
        func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey: Any]?) throws {
            DispatchQueue.main.async {
                self.directoriesCreated.append(url.path)
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
        
        func removeItem(at url: URL) throws {
            itemsRemoved.append(url.path)
        }
    }
    
    private class Printer {
        private(set) var printedLogs = [String]()
        
        func print(string: String) {
            DispatchQueue.main.async {
                self.printedLogs.append(string)
            }
        }
    }
    
    static let operationListUsersDocumentation = OperationDocumentation(
        id: "users-get_collection",
        hierarchy: .init(paths: [
            [
                "doc://com.apple.documentation/documentation/technologies",
                "doc://com.apple.documentation/documentation/appstoreconnectapi",
                "doc://com.apple.documentation/documentation/appstoreconnectapi/users"
            ]
        ]),
        title: "List Users",
        responses: [
            .init(status: 200, reason: "OK"),
            .init(status: 400, reason: "Bad Request", description: "An error occurred with your request.")
        ]
    )
    
    static let operationListVisibleAppIdsForUserDocumentation = OperationDocumentation(
        id: "users-visibleApps-get_to_many_relationship",
        hierarchy: .init(paths: [
            [
                "doc://com.apple.documentation/documentation/technologies",
                "doc://com.apple.documentation/documentation/appstoreconnectapi",
                "doc://com.apple.documentation/documentation/appstoreconnectapi/users"
            ]
        ]),
        title: "Get All Visible App Resource IDs for a User",
        responses: [
            .init(status: 200, reason: "OK"),
            .init(status: 400, reason: "Bad Request", description: "An error occurred with your request.")
        ]
    )

    static let schemaDocumentation = ObjectDocumentation(
        id: "doc://com.apple.documentation/documentation/appstoreconnectapi/user",
        title: "User",
        abstract: "The data structure that represents a Users resource.",
        properties: [
            "attributes": .init(required: false, description: "The resource's attributes."),
            "id": .init(required: true, description: "The opaque resource ID that uniquely identifies the resource."),
            "links": .init(required: true, description: "Navigational links that include the self-link."),
            "relationships": .init(required: false, description: "Navigational links to related data and included resource types and IDs."),
            "type": .init(required: true, description: "The resource type.")
        ]
    )

    let loadFile: (URL) throws -> Data = { url in
        let jsonEncoder = JSONEncoder()
        if url.lastPathComponent == DocsFilename.operationDocumentation.filename {
            return try jsonEncoder.encode([
                operationListUsersDocumentation.id: Documentation.operation(operationListUsersDocumentation),
                operationListVisibleAppIdsForUserDocumentation.id: Documentation.operation(operationListVisibleAppIdsForUserDocumentation),
            ])
        } else if url.lastPathComponent == DocsFilename.schemaMapping.filename {
            return try jsonEncoder.encode(["User": "doc://com.apple.documentation/documentation/appstoreconnectapi/user"])
        } else { // if url.lastPathComponent == DocsFilename.schemaDocumentation.filename {
            return try jsonEncoder.encode([schemaDocumentation.id: Documentation.object(schemaDocumentation)])
        }
    }
}
