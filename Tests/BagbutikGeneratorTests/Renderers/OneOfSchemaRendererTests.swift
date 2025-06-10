@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class OneOfSchemaRendererTests: XCTestCase {
    func testRender() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: ["some://url": .object(
            .init(id: "/test", title: "Test", abstract: "A test.", discussion: "", properties: ["href": .init(required: false, description: "An URL")], subDocumentationIds: []))]
        )
        let renderer = OneOfSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let subSchema = ObjectSchema(name: "Test", url: "some://url", properties: [
            "href": .init(type: .simple(.string())),
            "meta": .init(type: .schema(.init(name: "Meta", url: "", properties: [
                "source": .init(type: .simple(.string()))
            ])))])
        let schema = OneOfSchema(options: [.schemaRef("BundleId"), .objectSchema(subSchema), .simple(.string())])
        // When
        let rendered = try await renderer.render(name: "Included", oneOfSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public enum Included: Codable, Sendable {
            case bundleId(BundleId)
            case string(String)
            case test(Test)

            public init(from decoder: Decoder) throws {
                if let bundleId = try? BundleId(from: decoder) {
                    self = .bundleId(bundleId)
                } else if let string = try? String(from: decoder) {
                    self = .string(string)
                } else if let test = try? Test(from: decoder) {
                    self = .test(test)
                } else {
                    throw DecodingError.typeMismatch(
                        Included.self,
                        DecodingError.Context(
                            codingPath: decoder.codingPath,
                            debugDescription: "Unknown Included"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                switch self {
                case let .bundleId(value):
                    try value.encode(to: encoder)
                case let .string(value):
                    try value.encode(to: encoder)
                case let .test(value):
                    try value.encode(to: encoder)
                }
            }
        
            /**
             # Test
             A test.

             Full documentation:
             <some://url>
             */
            public struct Test: Codable, Sendable {
                /// An URL
                public var href: String?
                public var meta: Meta?

                public init(href: String? = nil,
                            meta: Meta? = nil)
                {
                    self.href = href
                    self.meta = meta
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    href = try container.decodeIfPresent(String.self, forKey: "href")
                    meta = try container.decodeIfPresent(Meta.self, forKey: "meta")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(href, forKey: "href")
                    try container.encodeIfPresent(meta, forKey: "meta")
                }

                public struct Meta: Codable, Sendable {
                    public var source: String?

                    public init(source: String? = nil) {
                        self.source = source
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        source = try container.decodeIfPresent(String.self, forKey: "source")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(source, forKey: "source")
                    }
                }
            }
        }
        """#)
    }
    
    func testRenderWithAdditionalProtocol() async throws {
        // Given
        let docsLoader = DocsLoader(schemaDocumentationById: ["some://url": .object(
            .init(id: "/test", title: "Test", abstract: "A test.", discussion: "", properties: ["href": .init(required: false, description: "An URL")], subDocumentationIds: []))]
        )
        let renderer = OneOfSchemaRenderer(docsLoader: docsLoader, shouldFormat: true)
        let schema = OneOfSchema(options: [.schemaRef("BundleId"), .simple(.string())], additionalProtocols: ["Fooable"])
        // When
        let rendered = try await renderer.render(name: "Included", oneOfSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public enum Included: Codable, Sendable, Fooable {
            case bundleId(BundleId)
            case string(String)

            public init(from decoder: Decoder) throws {
                if let bundleId = try? BundleId(from: decoder) {
                    self = .bundleId(bundleId)
                } else if let string = try? String(from: decoder) {
                    self = .string(string)
                } else {
                    throw DecodingError.typeMismatch(
                        Included.self,
                        DecodingError.Context(
                            codingPath: decoder.codingPath,
                            debugDescription: "Unknown Included"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                switch self {
                case let .bundleId(value):
                    try value.encode(to: encoder)
                case let .string(value):
                    try value.encode(to: encoder)
                }
            }
        }
        """#)
    }
}
