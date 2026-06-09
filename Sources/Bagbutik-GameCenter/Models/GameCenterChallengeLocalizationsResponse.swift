import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterChallengeLocalizationsResponse
 A response containing a list of localizations for a Game Center challenge.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterchallengelocalizationsresponse>
 */
public struct GameCenterChallengeLocalizationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterChallengeLocalization

    public let data: [GameCenterChallengeLocalization]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterChallengeLocalization],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([GameCenterChallengeLocalization].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getImage(for gameCenterChallengeLocalization: GameCenterChallengeLocalization) -> GameCenterChallengeImage? {
        included?.compactMap { relationship -> GameCenterChallengeImage? in
            guard case let .gameCenterChallengeImage(image) = relationship else { return nil }
            return image
        }.first { $0.id == gameCenterChallengeLocalization.relationships?.image?.data?.id }
    }

    public func getVersion(for gameCenterChallengeLocalization: GameCenterChallengeLocalization) -> GameCenterChallengeVersion? {
        included?.compactMap { relationship -> GameCenterChallengeVersion? in
            guard case let .gameCenterChallengeVersion(version) = relationship else { return nil }
            return version
        }.first { $0.id == gameCenterChallengeLocalization.relationships?.version?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case gameCenterChallengeImage(GameCenterChallengeImage)
        case gameCenterChallengeVersion(GameCenterChallengeVersion)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "gameCenterChallengeImages":
                self = .gameCenterChallengeImage(try GameCenterChallengeImage(from: decoder))
            case "gameCenterChallengeVersions":
                self = .gameCenterChallengeVersion(try GameCenterChallengeVersion(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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
