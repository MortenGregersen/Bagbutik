import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardImageResponse
 A response that contains a single leaderboard image resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardimageresponse>
 */
public struct GameCenterLeaderboardImageResponse: Codable, Sendable {
    public let data: GameCenterLeaderboardImage
    public var included: [GameCenterLeaderboardLocalization]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardImage,
                included: [GameCenterLeaderboardLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterLeaderboardImage.self, forKey: "data")
        included = try container.decodeIfPresent([GameCenterLeaderboardLocalization].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
