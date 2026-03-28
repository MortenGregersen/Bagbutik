@testable import BagbutikDocsCollector
import XCTest

final class PropertyDocumentationTests: XCTestCase {
    func testInitAndCodableRoundTrip() throws {
        let documentation = PropertyDocumentation(required: true, description: "The property description.")

        let data = try JSONEncoder().encode(documentation)
        let decodedDocumentation = try JSONDecoder().decode(PropertyDocumentation.self, from: data)

        XCTAssertEqual(decodedDocumentation, documentation)
    }

    func testInitWithNilDescription() {
        let documentation = PropertyDocumentation(required: false, description: nil)

        XCTAssertFalse(documentation.required)
        XCTAssertNil(documentation.description)
    }
}
