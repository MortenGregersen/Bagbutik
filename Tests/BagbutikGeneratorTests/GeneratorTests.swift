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
                  documentation: .init(title: "List ids for visible apps for user", summary: "Get a list ids for visible apps for user", url: "https://developer.apple.com"),
                  method: .get,
                  successResponseType: "UserVisibleAppsLinkagesResponse",
                  errorResponseType: "ErrorResponse"),
        ]),
    ],
    components: .init(schemas: [
        "UsersResponse": .object(.init(name: "UsersResponse", properties: ["users": .arrayOfSchemaRef("User")])),
        "ReplaceUsersResponse": .enum(.init(type: "String", values: ["none", "some"], name: "ReplaceUsersResponse")),
    ]))
    
    func testGenerateAllSimple() throws {
        // Given
        let fileManager = MockFileManager()
        let printer = Printer()
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, print: printer.print)
        // When
        try generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL)
        // Then
        continueAfterFailure = false
        XCTAssertEqual(fileManager.itemsRemoved.count, 2)
        XCTAssertEqual(fileManager.itemsRemoved[0], "Endpoints")
        XCTAssertEqual(fileManager.itemsRemoved[1], "Models")
        XCTAssertEqual(fileManager.directoriesCreated.count, 4)
        XCTAssertEqual(fileManager.directoriesCreated[0], "Endpoints")
        XCTAssertEqual(fileManager.directoriesCreated[1], "Users")
        XCTAssertEqual(fileManager.directoriesCreated[2], "Relationships")
        XCTAssertEqual(fileManager.directoriesCreated[3], "Models")
        XCTAssertEqual(fileManager.filesCreated.count, 4)
        XCTAssertEqual(fileManager.filesCreated[0].name, "ListUsers.swift")
        XCTAssertEqual(fileManager.filesCreated[1].name, "ListVisibleAppIdsForUser.swift")
        XCTAssertEqual(fileManager.filesCreated[2].name, "ReplaceUsersResponse.swift")
        XCTAssertEqual(fileManager.filesCreated[3].name, "UsersResponse.swift")
    }
    
    func testInvalidSpecFileURL() throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = URL(string: "https://developer.apple.com")!
        let outputDirURL = validOutputDirURL
        var thrownError: Error?
        XCTAssertThrowsError(try generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL)) {
            thrownError = $0
        }
        // Then
        XCTAssertEqual(thrownError as? GeneratorError, GeneratorError.notFileUrl(.specFileURL))
    }
    
    func testInvalidOutputDirURL() throws {
        // Given
        let generator = Generator()
        // When
        let specFileURL = validSpecFileURL
        let outputDirURL = URL(string: "https://developer.apple.com")!
        var thrownError: Error?
        XCTAssertThrowsError(try generator.generateAll(specFileURL: specFileURL, outputDirURL: outputDirURL)) {
            thrownError = $0
        }
        // Then
        XCTAssertEqual(thrownError as? GeneratorError, GeneratorError.notFileUrl(.outputDirURL))
    }
    
    func testFailedCreatingEndpoint() throws {
        // Given
        let fileManager = MockFileManager()
        fileManager.fileNameToFailCreating = "ListUsers.swift"
        let printer = Printer()
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, print: printer.print)
        var thrownError: Error?
        XCTAssertThrowsError(try generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL)) {
            thrownError = $0
        }
        // Then
        XCTAssertEqual(thrownError as? GeneratorError, GeneratorError.couldNotCreateFile("ListUsers.swift"))
    }
    
    func testFailedCreatingModel() throws {
        // Given
        let fileManager = MockFileManager()
        fileManager.fileNameToFailCreating = "UsersResponse.swift"
        let printer = Printer()
        let generator = Generator(loadSpec: { _ in self.testSpec }, fileManager: fileManager, print: printer.print)
        var thrownError: Error?
        XCTAssertThrowsError(try generator.generateAll(specFileURL: validSpecFileURL, outputDirURL: validOutputDirURL)) {
            thrownError = $0
        }
        // Then
        XCTAssertEqual(thrownError as? GeneratorError, GeneratorError.couldNotCreateFile("UsersResponse.swift"))
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
        func print(string: String) {}
    }
}
