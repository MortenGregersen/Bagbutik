import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterChallengeVersionReleasesResponse
 A response that contains a list of challenge resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterchallengeversionreleasesresponse>
 */
public struct GameCenterChallengeVersionReleasesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterChallengeVersionRelease

    public let data: [GameCenterChallengeVersionRelease]
    public var included: [GameCenterChallengeVersion]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterChallengeVersionRelease],
                included: [GameCenterChallengeVersion]? = nil,
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
        data = try container.decode([GameCenterChallengeVersionRelease].self, forKey: "data")
        included = try container.decodeIfPresent([GameCenterChallengeVersion].self, forKey: "included")
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

    public func getVersion(for gameCenterChallengeVersionRelease: GameCenterChallengeVersionRelease) -> GameCenterChallengeVersion? {
        included?.first { $0.id == gameCenterChallengeVersionRelease.relationships?.version?.data?.id }
    }
}
