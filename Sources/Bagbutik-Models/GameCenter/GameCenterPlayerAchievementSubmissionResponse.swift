import Bagbutik_Core
import Foundation

/**
 # GameCenterPlayerAchievementSubmissionResponse
 A response that contains a single Game Center player achievement resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterplayerachievementsubmissionresponse>
 */
public struct GameCenterPlayerAchievementSubmissionResponse: Codable {
    public let data: GameCenterPlayerAchievementSubmission
    public let links: DocumentLinks

    public init(data: GameCenterPlayerAchievementSubmission,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
