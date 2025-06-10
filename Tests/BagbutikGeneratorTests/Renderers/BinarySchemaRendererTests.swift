@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class BinarySchemaRendererTests: XCTestCase {
    func testRenderPlain() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [
            "some://url": .object(
                .init(id: "/gzip", title: "Gzip", abstract: "Some summary", discussion: nil, properties: [:], subDocumentationIds: []))
        ])
        let renderer = BinarySchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = BinarySchema(name: "Gzip", url: "some://url")
        // When
        let rendered = try await renderer.render(binarySchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        /// Some summary
        public struct Gzip: BinaryResponse {
            public let data: Data

            public static func from(data: Data) -> Gzip {
                return Self(data: data)
            }

            public init(data: Data) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decode(Data.self, forKey: "data")
            }
        }
        """#)
    }

    func testRender_NoDocumentation() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: [:])
        let renderer = BinarySchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = BinarySchema(name: "Gzip", url: "some://url")
        // When
        let rendered = try await renderer.render(binarySchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public struct Gzip: BinaryResponse {
            public let data: Data

            public static func from(data: Data) -> Gzip {
                return Self(data: data)
            }

            public init(data: Data) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decode(Data.self, forKey: "data")
            }
        }
        """#)
    }
}
