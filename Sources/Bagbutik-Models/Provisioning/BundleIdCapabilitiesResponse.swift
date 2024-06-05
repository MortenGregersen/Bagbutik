import Bagbutik_Core
import Foundation

/**
 # BundleIdCapabilitiesResponse
 A response that contains a list of Bundle ID Capability resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitiesresponse>
 */
public struct BundleIdCapabilitiesResponse: Codable, PagedResponse {
    public typealias Data = BundleIdCapability

    /// The resource data.
    public let data: [BundleIdCapability]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [BundleIdCapability],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([BundleIdCapability].self, forKey: "data")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }
}
