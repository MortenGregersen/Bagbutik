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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(GameCenterLeaderboardEntrySubmission.self, forKey: .data)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case links
    }
}
