@testable import BagbutikDocsCollector
@testable import BagbutikGenerator
@testable import BagbutikSpecDecoder
import XCTest

final class OneOfSchemaRendererTests: XCTestCase {
    func testRender() throws {
        // Given
        let renderer = OneOfSchemaRenderer(docsLoader: DocsLoader())
        let schema = OneOfSchema(options: [.schemaRef("BundleId"), .schemaRef("Certificate"), .schemaRef("Device")])
        // When
        let rendered = try renderer.render(name: "Included", oneOfSchema: schema)
        // Then
        XCTAssertEqual(rendered, #"""
        public enum Included: Codable {
            case bundleId(BundleId)
            case certificate(Certificate)
            case device(Device)

            public init(from decoder: Decoder) throws {
                if let bundleId = try? BundleId(from: decoder) {
                    self = .bundleId(bundleId)
                } else if let certificate = try? Certificate(from: decoder) {
                    self = .certificate(certificate)
                } else if let device = try? Device(from: decoder) {
                    self = .device(device)
                } else {
                    throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                          debugDescription: "Unknown Included"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                switch self {
                case let .bundleId(value):
                    try value.encode(to: encoder)
                case let .certificate(value):
                    try value.encode(to: encoder)
                case let .device(value):
                    try value.encode(to: encoder)
                }
            }
        }

        """#)
    }
}
