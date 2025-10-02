import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterMatchmakingTestRequest
 The type and ID of test matchmaking request.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestrequest>
 */
public struct GameCenterMatchmakingTestRequest: Codable, Sendable, Identifiable, RequestBody {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterMatchmakingTestRequests" }

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
