import BagbutikCore
import Foundation

/**
 # GameCenterDetailPlayerResponse

 The response body for endpoints that modify a Game Center player in an app’s Game Center configuration.

 ```
 object GameCenterDetailPlayerResponse
 ```

 ## Overview

 The [`Modify a Game Center Detail Player`](https://developer.apple.com/documentation/AppStoreConnectAPI/PATCH-v1-gameCenterDetailPlayers-_id_) endpoint returns this response.

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterdetailplayerresponse>
 */
public struct GameCenterDetailPlayerResponse: Codable, Sendable {
    public let data: GameCenterDetailPlayer
    public let links: DocumentLinks

    public init(data: GameCenterDetailPlayer,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterDetailPlayer.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
