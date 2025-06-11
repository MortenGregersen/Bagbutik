import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivityVersionReleaseResponse
 A response that contains a single activity version release resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivityversionreleaseresponse>
 */
public struct GameCenterActivityVersionReleaseResponse: Codable, Sendable {
    public let data: GameCenterActivityVersionRelease
    public var included: [GameCenterActivityVersion]?
    public let links: DocumentLinks

    public init(data: GameCenterActivityVersionRelease,
                included: [GameCenterActivityVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterActivityVersionRelease.self, forKey: "data")
        included = try container.decodeIfPresent([GameCenterActivityVersion].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
