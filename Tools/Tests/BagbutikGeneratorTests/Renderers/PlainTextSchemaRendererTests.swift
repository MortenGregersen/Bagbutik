@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class PlainTextSchemaRendererTests: XCTestCase {
    func testRenderPlain() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [
            "some://url": .object(
                .init(id: "/csv", title: "Csv", abstract: "Some summary", discussion: nil, properties: [:], subDocumentationIds: []))
        ])
        let renderer = PlainTextSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = PlainTextSchema(name: "Csv", url: "some://url")
        // When
        let rendered = try await renderer.render(plainTextSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        /// Some summary
        public struct Csv: PlainTextResponse {
            public let text: String

            public static func from(text: String) -> Csv {
                return Self(text: text)
            }

            public init(text: String) {
                self.text = text
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                text = try container.decode(String.self, forKey: "text")
            }
        }
        """#)
    }

    func testRender_NoDocumentation() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = PlainTextSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = PlainTextSchema(name: "Csv", url: "some://url")
        // When
        let rendered = try await renderer.render(plainTextSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Csv: PlainTextResponse {
            public let text: String

            public static func from(text: String) -> Csv {
                return Self(text: text)
            }

            public init(text: String) {
                self.text = text
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                text = try container.decode(String.self, forKey: "text")
            }
        }
        """#)
    }
}
