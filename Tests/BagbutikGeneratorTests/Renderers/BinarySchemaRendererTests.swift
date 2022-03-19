@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class BinarySchemaRendererTests: XCTestCase {
    func testRenderPlain() throws {
        // Given
        let renderer = BinarySchemaRenderer()
        let schema = BinarySchema(name: "Gzip", url: "some://url") { _ in
            .rootSchema(summary: "Some summary")
        }
        // When
        let rendered = try renderer.render(binarySchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        /// Some summary
        public struct Gzip: BinaryResponse {
            public let data: Data

            public static func from(data: Data) -> Gzip {
                return Self(data: data)
            }
        }

        """#)
    }

    func testRender_NoDocumenation() throws {
        // Given
        let renderer = BinarySchemaRenderer()
        let schema = BinarySchema(name: "Gzip", url: "some://url") { _ in nil }
        // When
        let rendered = try renderer.render(binarySchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Gzip: BinaryResponse {
            public let data: Data

            public static func from(data: Data) -> Gzip {
                return Self(data: data)
            }
        }

        """#)
    }
}
