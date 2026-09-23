import BagbutikCore
import Foundation

/**
 # GameCenterMatchmakingTestPlayerPropertyInlineCreate

 A resource object that represents a player’s properties when you create a request.

 ```
 object GameCenterMatchmakingTestPlayerPropertyInlineCreate
 ```

 ## Topics

 ### Objects

 [`object GameCenterMatchmakingTestPlayerPropertyInlineCreate.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterMatchmakingTestPlayerPropertyInlineCreate/Attributes-data.dictionary)

 The attributes for sample player properties.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestplayerpropertyinlinecreate>
 */
public struct GameCenterMatchmakingTestPlayerPropertyInlineCreate: Codable, Sendable, Identifiable {
    public var id: String?
    public var type: String { "gameCenterMatchmakingTestPlayerProperties" }
    public var attributes: Attributes?

    public init(id: String? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decodeIfPresent(String.self, forKey: "id")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(id, forKey: "id")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
        public var playerId: String?
        public var properties: [Property]?

        public init(playerId: String? = nil,
                    properties: [Property]? = nil)
        {
            self.playerId = playerId
            self.properties = properties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            playerId = try container.decodeIfPresent(String.self, forKey: "playerId")
            properties = try container.decodeIfPresent([Property].self, forKey: "properties")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(playerId, forKey: "playerId")
            try container.encodeIfPresent(properties, forKey: "properties")
        }
    }
}
