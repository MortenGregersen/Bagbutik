import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleResponse
 The response body for endpoints that create or modify a rule.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleresponse>
 */
public struct GameCenterMatchmakingRuleResponse: Codable, Sendable {
    /// The rule that you create or modify.
    public let data: GameCenterMatchmakingRule
    public let links: DocumentLinks

    public init(data: GameCenterMatchmakingRule,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterMatchmakingRule.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
