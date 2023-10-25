import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingQueuesResponse
 The response body for endpoints that get multiple queues.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuesresponse>
 */
public struct GameCenterMatchmakingQueuesResponse: Codable, PagedResponse {
    public typealias Data = GameCenterMatchmakingQueue

    /// The queues that the endpoint fetches.
    public let data: [GameCenterMatchmakingQueue]
    /// The rule sets included in the response.
    public var included: [GameCenterMatchmakingRuleSet]?
    /// The link representations of the response.
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterMatchmakingQueue],
                included: [GameCenterMatchmakingRuleSet]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
