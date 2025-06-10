import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterChallengeLocalizationResponse
 A response that contains a single challenge resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterchallengelocalizationresponse>
 */
public struct GameCenterChallengeLocalizationResponse: Codable, Sendable {
    public let data: GameCenterChallengeLocalization
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterChallengeLocalization,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterChallengeLocalization.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getImage() -> GameCenterChallengeImage? {
        included?.compactMap { relationship -> GameCenterChallengeImage? in
            guard case let .gameCenterChallengeImage(image) = relationship else { return nil }
            return image
        }.first { $0.id == data.relationships?.image?.data?.id }
    }

    public func getVersion() -> GameCenterChallengeVersion? {
        included?.compactMap { relationship -> GameCenterChallengeVersion? in
            guard case let .gameCenterChallengeVersion(version) = relationship else { return nil }
            return version
        }.first { $0.id == data.relationships?.version?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case gameCenterChallengeImage(GameCenterChallengeImage)
        case gameCenterChallengeVersion(GameCenterChallengeVersion)

        public init(from decoder: Decoder) throws {
            if let gameCenterChallengeImage = try? GameCenterChallengeImage(from: decoder) {
                self = .gameCenterChallengeImage(gameCenterChallengeImage)
            } else if let gameCenterChallengeVersion = try? GameCenterChallengeVersion(from: decoder) {
                self = .gameCenterChallengeVersion(gameCenterChallengeVersion)
            } else {
                throw DecodingError.typeMismatch(
                    Included.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterChallengeImage(value):
                try value.encode(to: encoder)
            case let .gameCenterChallengeVersion(value):
                try value.encode(to: encoder)
            }
        }
    }
}
