import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardSetImageResponse
 A response that contains a single leaderboard set image resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardsetimageresponse>
 */
public struct GameCenterLeaderboardSetImageResponse: Codable {
    public let data: GameCenterLeaderboardSetImage
    public var included: [GameCenterLeaderboardSetLocalization]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardSetImage,
                included: [GameCenterLeaderboardSetLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
