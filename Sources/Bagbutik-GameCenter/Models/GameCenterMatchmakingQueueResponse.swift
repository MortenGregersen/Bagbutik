import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterMatchmakingQueueResponse
 The response body for endpoints that create, modify, or get a single queue.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueresponse>
 */
public struct GameCenterMatchmakingQueueResponse: Codable, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterMatchmakingQueue.self, forKey: "data")
        included = try container.decodeIfPresent([GameCenterMatchmakingRuleSet].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
