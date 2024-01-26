import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardEntrySubmissionResponse
 A response that contains a Game Center leaderboard entry submission.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardentrysubmissionresponse>
 */
public struct GameCenterLeaderboardEntrySubmissionResponse: Codable {
    public let data: GameCenterLeaderboardEntrySubmission
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardEntrySubmission,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
