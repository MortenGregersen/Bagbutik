import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleResponse
 The response body for endpoints that create or modify a rule.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleresponse>
 */
public struct GameCenterMatchmakingRuleResponse: Codable {
    /// The rule that you create or modify.
    public let data: GameCenterMatchmakingRule
    public let links: DocumentLinks

    public init(data: GameCenterMatchmakingRule,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
