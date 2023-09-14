import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardImageResponse
 A response that contains a single leaderboard image resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardimageresponse>
 */
public struct GameCenterLeaderboardImageResponse: Codable {
    public let data: GameCenterLeaderboardImage
    public var included: [GameCenterLeaderboardLocalization]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardImage,
                included: [GameCenterLeaderboardLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
