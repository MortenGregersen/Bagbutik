import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivityImageResponse
 A response that contains a single activity resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivityimageresponse>
 */
public struct GameCenterActivityImageResponse: Codable, Sendable {
    public let data: GameCenterActivityImage
    public let links: DocumentLinks

    public init(data: GameCenterActivityImage,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterActivityImage.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
