@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class GeneratorTests: XCTestCase {
    let validSpecFileURL = URL(fileURLWithPath: "/Users/steve/spec.json")
    let validOutputDirURL = URL(fileURLWithPath: "/Users/steve/output")
    let testSpec = Spec(paths: [
        "/v1/users": Path(path: "/v1/users", info: .init(mainType: "Users", isRelationship: false), operations: [
            .init(name: "listUsers",
                  documentation: .init(title: "List users", summary: "Get a list of users", url: "https://developer.apple.com"),
                  method: .get,
                  successResponseType: "UsersResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
        "/v1/users/{id}/relationships/visibleApps": Path(path: "/v1/users/{id}/relationships/visibleApps", info: .init(mainType: "Users", isRelationship: true), operations: [
            .init(name: "listVisibleAppIdsForUser",
                  documentation: nil,
                  method: .get,
                  successResponseType: "UserVisibleAppsLinkagesResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
    ],
    components: .init(schemas: [
        "UsersResponse": .object(.init(name: "UsersResponse", url: "some://url", properties: ["users": .init(type: .arrayOfSchemaRef("User"))])),
        "ReplaceUsersResponse": .enum(.init(name: "ReplaceUsersResponse", type: "String", caseValues: ["none", "some"])),
        "Gzip": .binary(.init(name: "Gzip", url: "other://url", lookupDocumentation: { _ in .rootSchema(summary: "Gzip response") })),
        "Csv": .plainText(.init(name: "Csv", url: "other://url", lookupDocumentation: { _ in .rootSchema(summary: "Csv response") })),
    ]))
    
    func testGenerateAllSimple() async throws {
        // Given
        let fileManager = MockFileManager()
        let printer = Printer()
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, print: printer.print)
        // When
        try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL)
        // Then
        continueAfterFailure = false
        XCTAssertEqual(fileManager.itemsRemoved.count, 2)
        XCTAssertEqual(fileManager.itemsRemoved.sorted(), ["Endpoints", "Models"])
        XCTAssertEqual(fileManager.directoriesCreated.count, 4)
        XCTAssertEqual(fileManager.directoriesCreated.sorted(), ["Endpoints", "Models", "Relationships", "Users"])
        XCTAssertEqual(fileManager.filesCreated.count, 6)
        XCTAssertEqual(fileManager.filesCreated.map(\.name).sorted(), [
            "Csv.swift",
            "Gzip.swift",
            "ListUsers.swift",
            "ListVisibleAppIdsForUser.swift",
            "ReplaceUsersResponse.swift",
            "UsersResponse.swift",
        ])
        XCTAssertEqual(printer.printedLogs[0], "🔍 Loading spec file:///Users/steve/spec.json...")
        XCTAssertEqual(printer.printedLogs[1...6].sorted(), [
            "⚡️ Generating endpoint ListUsers.swift...",
            "⚡️ Generating endpoint ListVisibleAppIdsForUser.swift...",
            "⚡️ Generating model Csv...",
            "⚡️ Generating model Gzip...",
            "⚡️ Generating model ReplaceUsersResponse...",
            "⚡️ Generating model UsersResponse...",
        ])
        XCTAssertEqual(printer.printedLogs[7...9].sorted(), [
            "⚠️ Documentation missing for endpoint: \'ListVisibleAppIdsForUser\'",
            "⚠️ Documentation missing for model: \'ReplaceUsersResponse\'",
            "⚠️ Documentation missing for model: \'UsersResponse\' (some://url)",
        ])
        XCTAssertEqual(printer.printedLogs[10], "🎉 Finished generating 2 endpoints and 4 models! 🎉")
    }
    
    func testInvalidSpecFileURL() async throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = URL(string: "https://developer.apple.com")!
        let outputDirURL = validOutputDirURL
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL)) {
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
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, GeneratorError.notFileUrl(.outputDirURL))
        }
    }
    
    func testUnloadableSpecFileURL() async throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = URL(fileURLWithPath: "/Users/timcook/app-store-connect-openapi-spec.json")
        let outputDirURL = validOutputDirURL
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL)) {
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
        fileManager.fileNameToFailCreating = "ListUsers.swift"
        let printer = Printer()
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, print: printer.print)
        // When
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, GeneratorError.couldNotCreateFile("ListUsers.swift"))
        }
    }
    
    func testFailedCreatingModel() async throws {
        // Given
        let fileManager = MockFileManager()
        fileManager.fileNameToFailCreating = "UsersResponse.swift"
        let printer = Printer()
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, print: printer.print)
        // When
        await XCTAssertAsyncThrowsError(try await generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL)) {
            // Then
            XCTAssertEqual($0 as? GeneratorError, GeneratorError.couldNotCreateFile("UsersResponse.swift"))
        }
    }
    
    private class MockFileManager: GeneratorFileManager {
        var directoriesCreated = [String]()
        var filesCreated = [(name: String, data: Data)]()
        var itemsRemoved = [String]()
        var fileNameToFailCreating: String?
        
        func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool, attributes: [FileAttributeKey: Any]?) throws {
            directoriesCreated.append(url.lastPathComponent)
        }
        
        func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey: Any]?) -> Bool {
            let fileName = path.components(separatedBy: "/").last!
            guard fileName != fileNameToFailCreating else { return false }
            filesCreated.append((name: fileName, data: data!))
            return true
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
