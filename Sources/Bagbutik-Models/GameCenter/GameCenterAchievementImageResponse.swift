import Bagbutik_Core
import Foundation

/**
 # GameCenterAchievementImageResponse
 A response that contains a single achievement image resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementimageresponse>
 */
public struct GameCenterAchievementImageResponse: Codable {
    public let data: GameCenterAchievementImage
    public var included: [GameCenterAchievementLocalization]?
    public let links: DocumentLinks

    public init(data: GameCenterAchievementImage,
                included: [GameCenterAchievementLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(GameCenterAchievementImage.self, forKey: .data)
        included = try container.decodeIfPresent([GameCenterAchievementLocalization].self, forKey: .included)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
    }
}
