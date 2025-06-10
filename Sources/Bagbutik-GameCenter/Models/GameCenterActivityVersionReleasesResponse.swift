import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivityVersionReleasesResponse
 A response that contains a list of activity version release resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivityversionreleasesresponse>
 */
public struct GameCenterActivityVersionReleasesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterActivityVersionRelease

    public let data: [GameCenterActivityVersionRelease]
    public var included: [GameCenterActivityVersion]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterActivityVersionRelease],
                included: [GameCenterActivityVersion]? = nil,
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
        data = try container.decode([GameCenterActivityVersionRelease].self, forKey: "data")
        included = try container.decodeIfPresent([GameCenterActivityVersion].self, forKey: "included")
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

    public func getVersion(for gameCenterActivityVersionRelease: GameCenterActivityVersionRelease) -> GameCenterActivityVersion? {
        included?.first { $0.id == gameCenterActivityVersionRelease.relationships?.version?.data?.id }
    }
}
