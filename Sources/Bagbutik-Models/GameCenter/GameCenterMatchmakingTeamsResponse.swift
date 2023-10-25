import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTeamsResponse
 The response body for endpoints that get multiple teams.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamsresponse>
 */
public struct GameCenterMatchmakingTeamsResponse: Codable, PagedResponse {
    public typealias Data = GameCenterMatchmakingTeam

    /// The teams that the endpoint fetches.
    public let data: [GameCenterMatchmakingTeam]
    /// The link representations of the object.
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterMatchmakingTeam],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
