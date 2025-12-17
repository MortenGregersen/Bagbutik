import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterAchievementImageV2Response
 A response that contains a single Game Center achievement image v2 resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementimagev2response>
 */
public struct GameCenterAchievementImageV2Response: Codable, Sendable {
    public let data: GameCenterAchievementImageV2
    public var included: [GameCenterAchievementLocalizationV2]?
    public let links: DocumentLinks

    public init(data: GameCenterAchievementImageV2,
                included: [GameCenterAchievementLocalizationV2]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterAchievementImageV2.self, forKey: "data")
        included = try container.decodeIfPresent([GameCenterAchievementLocalizationV2].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
