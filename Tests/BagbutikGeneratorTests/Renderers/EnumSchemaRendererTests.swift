@testable import BagbutikGenerator
import BagbutikSpecDecoder
import XCTest

final class EnumSchemaRendererTests: XCTestCase {
    func testRenderPlain() throws {
        // Given
        let renderer = EnumSchemaRenderer()
        let schema = EnumSchema(type: "string", values: ["MAC_OS", "IOS", "TV_OS", "WATCH_OS"], name: "Platform")
        // When
        let rendered = try renderer.render(enumSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public enum Platform: String, Codable, CaseIterable {
            case macOS = "MAC_OS"
            case iOS = "IOS"
            case tvOS = "TV_OS"
            case watchOS = "WATCH_OS"
        }

        """#)
    }

    func testRenderWithAdditionalProtocol() throws {
        // Given
        let renderer = EnumSchemaRenderer()
        let schema = EnumSchema(type: "string", values: ["parent", "platforms", "subcategories"], name: "AppCategories")
        // When
        let rendered = try renderer.render(enumSchema: schema, additionalProtocol: "ParameterValue")
        // Then
        XCTAssertEqual(rendered, #"""
        public enum AppCategories: String, ParameterValue, CaseIterable {
            case parent
            case platforms
            case subcategories
        }

        """#)
    }
}
