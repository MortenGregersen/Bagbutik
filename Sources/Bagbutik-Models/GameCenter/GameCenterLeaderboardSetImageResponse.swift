import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardSetImageResponse
 A response that contains a single leaderboard set image resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardsetimageresponse>
 */
public struct GameCenterLeaderboardSetImageResponse: Codable, Sendable {
    public let data: GameCenterLeaderboardSetImage
    public var included: [GameCenterLeaderboardSetLocalization]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardSetImage,
                included: [GameCenterLeaderboardSetLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterLeaderboardSetImage.self, forKey: "data")
        included = try container.decodeIfPresent([GameCenterLeaderboardSetLocalization].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
