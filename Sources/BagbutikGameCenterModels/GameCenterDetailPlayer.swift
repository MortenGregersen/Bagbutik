import BagbutikCore
import Foundation

/**
 # GameCenterDetailPlayer

 A Game Center player tied to a single game, whom you can block from playing that game.

 ```
 object GameCenterDetailPlayer
 ```

 ## Topics

 ### Objects

 [`object GameCenterDetailPlayer.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterDetailPlayer/Attributes-data.dictionary)

 The attributes that describe a Game Center detail player.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterdetailplayer>
 */
public struct GameCenterDetailPlayer: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterDetailPlayers" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
        public var blocked: Bool?
        public var bundleId: String?
        public var nickname: String?

        public init(blocked: Bool? = nil,
                    bundleId: String? = nil,
                    nickname: String? = nil)
        {
            self.blocked = blocked
            self.bundleId = bundleId
            self.nickname = nickname
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            blocked = try container.decodeIfPresent(Bool.self, forKey: "blocked")
            bundleId = try container.decodeIfPresent(String.self, forKey: "bundleId")
            nickname = try container.decodeIfPresent(String.self, forKey: "nickname")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(blocked, forKey: "blocked")
            try container.encodeIfPresent(bundleId, forKey: "bundleId")
            try container.encodeIfPresent(nickname, forKey: "nickname")
        }
    }
}
