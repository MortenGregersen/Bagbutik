import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CertificatesResponse
 A response that contains a list of Certificates resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificatesresponse>
 */
public struct CertificatesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = Certificate

    /// The resource data.
    public let data: [Certificate]
    public var included: [PassTypeId]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information
    public var meta: PagingInformation?

    public init(data: [Certificate],
                included: [PassTypeId]? = nil,
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
        data = try container.decode([Certificate].self, forKey: "data")
        included = try container.decodeIfPresent([PassTypeId].self, forKey: "included")
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

    public func getPassTypeId(for certificate: Certificate) -> PassTypeId? {
        included?.first { $0.id == certificate.relationships?.passTypeId?.data?.id }
    }
}
