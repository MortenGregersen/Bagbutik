@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class PlainTextSchemaRendererTests: XCTestCase {
    func testRenderPlain() throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [
            "some://url": .object(
                .init(id: "/csv", title: "Csv", abstract: "Some summary", discussion: nil, properties: [:], subDocumentationIds: []))
        ])
        let renderer = PlainTextSchemaRenderer(docsLoader: docsLoader)
        let schema = PlainTextSchema(name: "Csv", url: "some://url")
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

    func testRender_NoDocumentation() throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = PlainTextSchemaRenderer(docsLoader: docsLoader)
        let schema = PlainTextSchema(name: "Csv", url: "some://url")
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
