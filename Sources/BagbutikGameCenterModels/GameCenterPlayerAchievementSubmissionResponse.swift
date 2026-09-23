import BagbutikCore
import Foundation

/**
 # GameCenterPlayerAchievementSubmissionResponse

 A response confirming a Game Center player achievement submission was processed.

 ```
 object GameCenterPlayerAchievementSubmissionResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterplayerachievementsubmissionresponse>
 */
public struct GameCenterPlayerAchievementSubmissionResponse: Codable, Sendable {
    public let data: GameCenterPlayerAchievementSubmission
    public let links: DocumentLinks

    public init(data: GameCenterPlayerAchievementSubmission,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterPlayerAchievementSubmission.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
