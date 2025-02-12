import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CiWorkflowsResponse
 A response that contains a list of Workflows resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowsresponse>
 */
public struct CiWorkflowsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = CiWorkflow

    /// The resource data.
    public let data: [CiWorkflow]
    /// The requested relationship data.
    public var included: [Included]?
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [CiWorkflow],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([CiWorkflow].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getMacOsVersion(for ciWorkflow: CiWorkflow) -> CiMacOsVersion? {
        included?.compactMap { relationship -> CiMacOsVersion? in
            guard case let .ciMacOsVersion(macOsVersion) = relationship else { return nil }
            return macOsVersion
        }.first { $0.id == ciWorkflow.relationships?.macOsVersion?.data?.id }
    }

    public func getProduct(for ciWorkflow: CiWorkflow) -> CiProduct? {
        included?.compactMap { relationship -> CiProduct? in
            guard case let .ciProduct(product) = relationship else { return nil }
            return product
        }.first { $0.id == ciWorkflow.relationships?.product?.data?.id }
    }

    public func getRepository(for ciWorkflow: CiWorkflow) -> ScmRepository? {
        included?.compactMap { relationship -> ScmRepository? in
            guard case let .scmRepository(repository) = relationship else { return nil }
            return repository
        }.first { $0.id == ciWorkflow.relationships?.repository?.data?.id }
    }

    public func getXcodeVersion(for ciWorkflow: CiWorkflow) -> CiXcodeVersion? {
        included?.compactMap { relationship -> CiXcodeVersion? in
            guard case let .ciXcodeVersion(xcodeVersion) = relationship else { return nil }
            return xcodeVersion
        }.first { $0.id == ciWorkflow.relationships?.xcodeVersion?.data?.id }
    }

    public enum Included: Codable, Sendable {
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
    }
}
