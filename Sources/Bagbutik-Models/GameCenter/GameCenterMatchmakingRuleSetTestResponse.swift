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
}
