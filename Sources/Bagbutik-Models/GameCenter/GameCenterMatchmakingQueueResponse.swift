import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingQueueResponse
 The response body for endpoints that create, modify, or get a single queue.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueresponse>
 */
public struct GameCenterMatchmakingQueueResponse: Codable {
    /// The queue that you create, modify, or get.
    public let data: GameCenterMatchmakingQueue
    /// The rule sets included in the response.
    public var included: [GameCenterMatchmakingRuleSet]?
    /// The link representations of the response.
    public let links: DocumentLinks

    public init(data: GameCenterMatchmakingQueue,
                included: [GameCenterMatchmakingRuleSet]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
