import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # PassTypeIdsResponse
 A response that contains a list of pass type ids response resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/passtypeidsresponse>
 */
public struct PassTypeIdsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = PassTypeId

    public let data: [PassTypeId]
    public var included: [Certificate]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [PassTypeId],
                included: [Certificate]? = nil,
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
        data = try container.decode([PassTypeId].self, forKey: "data")
        included = try container.decodeIfPresent([Certificate].self, forKey: "included")
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

    public func getCertificates(for passTypeId: PassTypeId) -> [Certificate] {
        guard let certificateIds = passTypeId.relationships?.certificates?.data?.map(\.id) else { return [] }
        return included?.filter { certificateIds.contains($0.id) } ?? []
    }
}
