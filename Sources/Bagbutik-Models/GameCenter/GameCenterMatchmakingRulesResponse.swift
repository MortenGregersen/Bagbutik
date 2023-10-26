import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRulesResponse
 The response body for endpoints that get multiple rules.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesresponse>
 */
public struct GameCenterMatchmakingRulesResponse: Codable, PagedResponse {
    public typealias Data = GameCenterMatchmakingRule

    /// The rules that the endpoint gets.
    public let data: [GameCenterMatchmakingRule]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterMatchmakingRule],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
