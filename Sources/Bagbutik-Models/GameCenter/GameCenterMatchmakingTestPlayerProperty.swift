import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTestPlayerProperty
 The data structure that represents a test player’s type and ID.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestplayerproperty>
 */
public struct GameCenterMatchmakingTestPlayerProperty: Codable, Sendable, Identifiable {
    public let id: String
    /// The link representations of the object.
    public var links: ResourceLinks?
    /// The type of resource object.
    public var type: String { "gameCenterMatchmakingTestPlayerProperties" }

    public init(id: String,
                links: ResourceLinks? = nil)
    {
        self.id = id
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
    }
}
