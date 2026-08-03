@testable import BagbutikSpecDecoder
import XCTest

final class CreateDocumentationUrlTests: XCTestCase {
    func testCreateDocumentationUrlFiltersIgnoredPathComponents() {
        let url = createDocumentationUrl(
            forSchemaNamed: "App",
            withCodingPathComponents: ["Properties", "Items", "Source", "ErrorSourcePointer", "ErrorSourceParameter", "OneOf", "Index 0"]
        )

        XCTAssertEqual(url, "https://developer.apple.com/documentation/appstoreconnectapi/app")
    }

    func testCreateDocumentationUrlDoesNotAppendDuplicateSchemaName() {
        let url = createDocumentationUrl(
            forSchemaNamed: "VisibleApp",
            withCodingPathComponents: ["UsersResponse", "VisibleApp"]
        )

        XCTAssertEqual(url, "https://developer.apple.com/documentation/appstoreconnectapi/usersresponse/visibleapp")
    }
}
