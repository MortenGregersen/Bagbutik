@testable import BagbutikGenerator
import BagbutikSpecDecoder
import XCTest

final class EnumSchemaRendererTests: XCTestCase {
    func testRenderPlain() throws {
        // Given
        let renderer = EnumSchemaRenderer()
        let schema = EnumSchema(name: "Platform", type: "string", caseValues: ["MAC_OS", "IOS", "TV_OS"])
        // When
        let rendered = try renderer.render(enumSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        /// Strings that represent Apple operating systems.
        public enum Platform: String, Codable, CaseIterable {
            /// A string that represents macOS.
            case macOS = "MAC_OS"
            /// A string that represents iOS.
            case iOS = "IOS"
            /// A string that represents tvOS.
            case tvOS = "TV_OS"
        }

        """#)
    }

    func testRenderWithAdditionalProtocol() throws {
        // Given
        let renderer = EnumSchemaRenderer()
        let schema = EnumSchema(name: "AppCategories", type: "string", caseValues: ["parent", "platforms", "subcategories"])
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
