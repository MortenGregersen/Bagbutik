import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTestPlayerPropertyInlineCreate
 A resource object that represents a player’s properties when you create a request.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestplayerpropertyinlinecreate>
 */
public struct GameCenterMatchmakingTestPlayerPropertyInlineCreate: Codable, Identifiable {
    /// The identifier for the resource object.
    public var id: String?
    /// The type of the resource object.
    public var type: String { "gameCenterMatchmakingTestPlayerProperties" }
    /// The attributes of the resource object.
    public let attributes: Attributes

    public init(id: String? = nil,
                attributes: Attributes)
    {
        self.id = id
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decodeIfPresent(String.self, forKey: "id")
        attributes = try container.decode(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(id, forKey: "id")
        try container.encode(type, forKey: "type")
        try container.encode(attributes, forKey: "attributes")
    }

    /**
     # GameCenterMatchmakingTestPlayerPropertyInlineCreate.Attributes
     The attributes for sample player properties.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestplayerpropertyinlinecreate/attributes>
     */
    public struct Attributes: Codable {
        /// A unique identifier for the player.
        public let playerId: String
        /// The key-value pairs representing the game-specific property values.
        public var properties: [Property]?

        public init(playerId: String,
                    properties: [Property]? = nil)
        {
            self.playerId = playerId
            self.properties = properties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            playerId = try container.decode(String.self, forKey: "playerId")
            properties = try container.decodeIfPresent([Property].self, forKey: "properties")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(playerId, forKey: "playerId")
            try container.encodeIfPresent(properties, forKey: "properties")
        }
    }
}
