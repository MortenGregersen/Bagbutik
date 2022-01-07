@testable import BagbutikGenerator
import XCTest

final class PropertyRendererTests: XCTestCase {
    func testRenderNonReservedButOptional() throws {
        // Given
        let renderer = PropertyRenderer()
        // When
        let rendered = try renderer.render(id: "name", type: "string", optional: true)
        // Then
        XCTAssertEqual(rendered, "@NullCodable public var name: String?")
    }

    func testRenderReservedButNotOptional() throws {
        // Given
        let renderer = PropertyRenderer()
        // When
        let rendered = try renderer.render(id: "required", type: "bool", optional: false)
        // Then
        XCTAssertEqual(rendered, "public let `required`: Bool")
    }

    func testRenderDeprecated() throws {
        // Given
        let renderer = PropertyRenderer()
        // When
        let rendered = try renderer.render(id: "name", type: "string", optional: true, deprecated: true)
        // Then
        XCTAssertEqual(rendered, """
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        @NullCodable public var name: String? = nil
        """)
    }
}
