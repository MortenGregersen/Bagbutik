import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # ActorResponse
 A response containing a single audit log actor who performed a tracked action in App Store Connect.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/actorresponse>
 */
public struct ActorResponse: Codable, Sendable {
    public let data: Actor
    public let links: DocumentLinks

    public init(data: Actor,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Actor.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
