import Foundation

/**
 A response that contains a list of Workflows resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowsresponse>
 */
public struct CiWorkflowsResponse: Codable, PagedResponse {
    public typealias Data = CiWorkflow
    /// The resource data.
    public let data: [CiWorkflow]
    /// The included related resources.
    public let included: [Included]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [CiWorkflow], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public enum Included: Codable {
        case ciMacOsVersion(CiMacOsVersion)
        case ciProduct(CiProduct)
        case ciXcodeVersion(CiXcodeVersion)
        case scmRepository(ScmRepository)

        public init(from decoder: Decoder) throws {
            if let ciMacOsVersion = try? CiMacOsVersion(from: decoder) {
                self = .ciMacOsVersion(ciMacOsVersion)
            } else if let ciProduct = try? CiProduct(from: decoder) {
                self = .ciProduct(ciProduct)
            } else if let ciXcodeVersion = try? CiXcodeVersion(from: decoder) {
                self = .ciXcodeVersion(ciXcodeVersion)
            } else if let scmRepository = try? ScmRepository(from: decoder) {
                self = .scmRepository(scmRepository)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .ciMacOsVersion(value):
                try value.encode(to: encoder)
            case let .ciProduct(value):
                try value.encode(to: encoder)
            case let .ciXcodeVersion(value):
                try value.encode(to: encoder)
            case let .scmRepository(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }

        private enum TypeKeys: String, Codable {
            case ciMacOsVersion
            case ciProduct
            case ciXcodeVersion
            case scmRepository
        }
    }
}
