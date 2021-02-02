@testable import BagbutikGenerator
import XCTest

final class PropertyRendererTests: XCTestCase {
    func testRenderNonReservedButOptional() throws {
        // Given
        let renderer = PropertyRenderer()
        // When
        let rendered = try renderer.render(id: "name", type: "string", optional: true)
        // Then
        XCTAssertEqual(rendered, "public let name: String?")
    }

    func testRenderReservedButNotOptional() throws {
        // Given
        let renderer = PropertyRenderer()
        // When
        let rendered = try renderer.render(id: "required", type: "bool", optional: false)
        // Then
        XCTAssertEqual(rendered, "public let `required`: Bool")
    }
}
