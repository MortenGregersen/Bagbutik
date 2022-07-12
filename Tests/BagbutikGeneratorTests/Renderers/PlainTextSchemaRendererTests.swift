@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class PlainTextSchemaRendererTests: XCTestCase {
    func testRenderPlain() throws {
        // Given
        let renderer = PlainTextSchemaRenderer()
        let schema = PlainTextSchema(name: "Csv", url: "some://url") { _ in
            .rootSchema(summary: "Some summary")
        }
        // When
        let rendered = try renderer.render(plainTextSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        /// Some summary
        public struct Csv: PlainTextResponse {
            public let text: String

            public static func from(text: String) -> Csv {
                return Self(text: text)
            }
        }

        """#)
    }

    func testRender_NoDocumenation() throws {
        // Given
        let renderer = PlainTextSchemaRenderer()
        let schema = PlainTextSchema(name: "Csv", url: "some://url") { _ in nil }
        // When
        let rendered = try renderer.render(plainTextSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Csv: PlainTextResponse {
            public let text: String

            public static func from(text: String) -> Csv {
                return Self(text: text)
            }
        }

        """#)
    }
}
