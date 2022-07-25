@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class BinarySchemaRendererTests: XCTestCase {
    func testRenderPlain() throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [
            "some://url": .object(
                .init(id: "/gzip", title: "Gzip", abstract: "Some summary", discussion: nil, properties: [:], subDocumentationIds: []))
        ])
        let renderer = BinarySchemaRenderer(docsLoader: docsLoader)
        let schema = BinarySchema(name: "Gzip", url: "some://url")
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
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = BinarySchemaRenderer(docsLoader: docsLoader)
        let schema = BinarySchema(name: "Gzip", url: "some://url")
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
