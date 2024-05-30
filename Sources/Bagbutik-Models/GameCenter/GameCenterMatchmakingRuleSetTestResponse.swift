import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleSetTestResponse
 The response body for testing a rule set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettestresponse>
 */
public struct GameCenterMatchmakingRuleSetTestResponse: Codable {
    public let data: GameCenterMatchmakingRuleSetTest
    public let links: DocumentLinks

    public init(data: GameCenterMatchmakingRuleSetTest,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(GameCenterMatchmakingRuleSetTest.self, forKey: .data)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case links
    }
}
