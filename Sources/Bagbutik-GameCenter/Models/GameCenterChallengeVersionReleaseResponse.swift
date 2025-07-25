import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterChallengeVersionReleaseResponse
 A response that contains a single challenge resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterchallengeversionreleaseresponse>
 */
public struct GameCenterChallengeVersionReleaseResponse: Codable, Sendable {
    public let data: GameCenterChallengeVersionRelease
    public var included: [GameCenterChallengeVersion]?
    public let links: DocumentLinks

    public init(data: GameCenterChallengeVersionRelease,
                included: [GameCenterChallengeVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterChallengeVersionRelease.self, forKey: "data")
        included = try container.decodeIfPresent([GameCenterChallengeVersion].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
