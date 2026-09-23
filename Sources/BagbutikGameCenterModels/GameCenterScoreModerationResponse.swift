import BagbutikCore
import Foundation

/**
 # GameCenterScoreModerationResponse

 The response body for endpoints that modify a single Game Center score moderation.

 ```
 object GameCenterScoreModerationResponse
 ```

 ## Overview

 The [`Modify a Game Center Score Moderation`](https://developer.apple.com/documentation/AppStoreConnectAPI/PATCH-v1-gameCenterScoreModerations-_id_) endpoint returns this response.

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterscoremoderationresponse>
 */
public struct GameCenterScoreModerationResponse: Codable, Sendable {
    public let data: GameCenterScoreModeration
    public var included: [GameCenterDetailPlayer]?
    public let links: DocumentLinks

    public init(data: GameCenterScoreModeration,
                included: [GameCenterDetailPlayer]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterScoreModeration.self, forKey: "data")
        included = try container.decodeIfPresent([GameCenterDetailPlayer].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
