import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AndroidToIosAppMappingDetailsResponse
 A response that contains a list of Android to iOS app mapping details response resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/androidtoiosappmappingdetailsresponse>
 */
public struct AndroidToIosAppMappingDetailsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AndroidToIosAppMappingDetail

    public let data: [AndroidToIosAppMappingDetail]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AndroidToIosAppMappingDetail],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([AndroidToIosAppMappingDetail].self, forKey: "data")
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
