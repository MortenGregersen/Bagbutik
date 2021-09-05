import Foundation

/**
 A response that contains a single Workflows resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowresponse>
 */
public struct CiWorkflowResponse: Codable {
    /// The resource data.
    public let data: CiWorkflow
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiWorkflow, included: [Included]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }

    public enum Included: Codable {
        case macOsVersion(CiMacOsVersion)
        case product(CiProduct)
        case repository(ScmRepository)
        case xcodeVersion(CiXcodeVersion)

        public init(from decoder: Decoder) throws {
            if let macOsVersion = try? CiMacOsVersion(from: decoder) {
                self = .macOsVersion(macOsVersion)
            } else if let product = try? CiProduct(from: decoder) {
                self = .product(product)
            } else if let repository = try? ScmRepository(from: decoder) {
                self = .repository(repository)
            } else if let xcodeVersion = try? CiXcodeVersion(from: decoder) {
                self = .xcodeVersion(xcodeVersion)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .macOsVersion(value):
                try value.encode(to: encoder)
            case let .product(value):
                try value.encode(to: encoder)
            case let .repository(value):
                try value.encode(to: encoder)
            case let .xcodeVersion(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case macOsVersion
            case product
            case repository
            case xcodeVersion
        }
    }
}
