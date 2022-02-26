@testable import BagbutikGenerator
import XCTest

final class PropertyRendererTests: XCTestCase {
    func testRenderNonReservedButOptional() throws {
        // Given
        let renderer = PropertyRenderer()
        // When
        let rendered = try renderer.render(id: "name", type: "string", optional: true, isSimpleType: true)
        // Then
        XCTAssertEqual(rendered, "public var name: String?")
    }

    func testRenderReservedButNotOptional() throws {
        // Given
        let renderer = PropertyRenderer()
        // When
        let rendered = try renderer.render(id: "required", type: "bool", optional: false, isSimpleType: true)
        // Then
        XCTAssertEqual(rendered, "public let `required`: Bool")
    }
    
    func testNullCodableOnNonSimpleOptional() throws {
        // Given
        let renderer = PropertyRenderer()
        // When
        let rendered = try renderer.render(id: "device", type: "Device", optional: true, isSimpleType: false)
        // Then
        XCTAssertEqual(rendered, "@NullCodable public var device: Device?")
        // It is necessary to add the @NullCodable property wrapper, to ensure that optionals are encoded as null.
        // If this is not done, the JSONEncoder will leave out optionals from the JSON instead.
    }
    
    func testNoNullCodableOnNonSimpleNotOptional() throws {
        // Given
        let renderer = PropertyRenderer()
        // When
        let rendered = try renderer.render(id: "device", type: "Device", optional: false, isSimpleType: false)
        // Then
        XCTAssertEqual(rendered, "public let device: Device")
    }

    func testRenderDeprecated() throws {
        // Given
        let renderer = PropertyRenderer()
        // When
        let rendered = try renderer.render(id: "name", type: "string", optional: true, isSimpleType: true, deprecated: true)
        // Then
        XCTAssertEqual(rendered, """
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var name: String? = nil
        """)
    }
}
