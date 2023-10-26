import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTestRequest
 The data structure that represents a sample match request in a response.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingtestrequest>
 */
public struct GameCenterMatchmakingTestRequest: Codable, Identifiable, RequestBody {
    /// A unique identifier for the sample match request.
    public let id: String
    /// The link representations of the object.
    public var links: ResourceLinks?
    /// The type of the resource object.
    public var type: String { "gameCenterMatchmakingTestRequests" }

    public init(id: String,
                links: ResourceLinks? = nil)
    {
        self.id = id
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
    }
}
