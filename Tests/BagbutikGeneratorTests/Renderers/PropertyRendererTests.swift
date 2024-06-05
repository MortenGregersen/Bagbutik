import BagbutikDocsCollector
@testable import BagbutikGenerator
import XCTest

final class PropertyRendererTests: XCTestCase {
    func testRenderNonReservedButOptional() throws {
        // Given
        let renderer = PropertyRenderer(docsLoader: DocsLoader(), shouldFormat: true)
        // When
        let rendered = renderer.renderProperty(id: "name", type: "string", optional: true, isSimpleType: true)
        // Then
        XCTAssertEqual(rendered, "public var name: String?")
    }

    func testRenderReservedButNotOptional() throws {
        // Given
        let renderer = PropertyRenderer(docsLoader: DocsLoader(), shouldFormat: true)
        // When
        let rendered = renderer.renderProperty(id: "required", type: "bool", optional: false, isSimpleType: true)
        // Then
        XCTAssertEqual(rendered, "public let `required`: Bool")
    }

    func testNoNullCodableOnNonSimpleOptionalNotData() throws {
        // Given
        let renderer = PropertyRenderer(docsLoader: DocsLoader(), shouldFormat: true)
        // When
        let rendered = renderer.renderProperty(id: "device", type: "Device", optional: true, isSimpleType: false)
        // Then
        XCTAssertEqual(rendered, "public var device: Device?")
    }

    func testNoNullCodableOnNonSimpleNotOptional() throws {
        // Given
        let renderer = PropertyRenderer(docsLoader: DocsLoader(), shouldFormat: true)
        // When
        let rendered = renderer.renderProperty(id: "device", type: "Device", optional: false, isSimpleType: false)
        // Then
        XCTAssertEqual(rendered, "public let device: Device")
    }

    func testRenderDeprecated() throws {
        // Given
        let renderer = PropertyRenderer(docsLoader: DocsLoader(), shouldFormat: true)
        // When
        let rendered = renderer.renderProperty(id: "name", type: "string", optional: true, isSimpleType: true, deprecated: true)
        // Then
        XCTAssertEqual(rendered, """
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var name: String? = nil
        """)
    }
}
