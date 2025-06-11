import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetsResponse
 A response that contains a list of background asset version resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetsresponse>
 */
public struct BackgroundAssetsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BackgroundAsset

    public let data: [BackgroundAsset]
    public var included: [BackgroundAssetVersion]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BackgroundAsset],
                included: [BackgroundAssetVersion]? = nil,
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
        data = try container.decode([BackgroundAsset].self, forKey: "data")
        included = try container.decodeIfPresent([BackgroundAssetVersion].self, forKey: "included")
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

    public func getInternalBetaVersion(for backgroundAsset: BackgroundAsset) -> BackgroundAssetVersion? {
        included?.first { $0.id == backgroundAsset.relationships?.internalBetaVersion?.data?.id }
    }
}
