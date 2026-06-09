import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterAchievementLocalizationsResponse
 The response body for endpoints that list Game Center achievement localizations.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementlocalizationsresponse>
 */
public struct GameCenterAchievementLocalizationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterAchievementLocalization

    public let data: [GameCenterAchievementLocalization]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterAchievementLocalization],
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
        data = try container.decode([GameCenterAchievementLocalization].self, forKey: "data")
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

    public func getGameCenterAchievement(for gameCenterAchievementLocalization: GameCenterAchievementLocalization) -> GameCenterAchievement? {
        included?.compactMap { relationship -> GameCenterAchievement? in
            guard case let .gameCenterAchievement(gameCenterAchievement) = relationship else { return nil }
            return gameCenterAchievement
        }.first { $0.id == gameCenterAchievementLocalization.relationships?.gameCenterAchievement?.data?.id }
    }

    public func getGameCenterAchievementImage(for gameCenterAchievementLocalization: GameCenterAchievementLocalization) -> GameCenterAchievementImage? {
        included?.compactMap { relationship -> GameCenterAchievementImage? in
            guard case let .gameCenterAchievementImage(gameCenterAchievementImage) = relationship else { return nil }
            return gameCenterAchievementImage
        }.first { $0.id == gameCenterAchievementLocalization.relationships?.gameCenterAchievementImage?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case gameCenterAchievement(GameCenterAchievement)
        case gameCenterAchievementImage(GameCenterAchievementImage)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "gameCenterAchievements":
                self = .gameCenterAchievement(try GameCenterAchievement(from: decoder))
            case "gameCenterAchievementImages":
                self = .gameCenterAchievementImage(try GameCenterAchievementImage(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterAchievement(value):
                try value.encode(to: encoder)
            case let .gameCenterAchievementImage(value):
                try value.encode(to: encoder)
            }
        }
    }
}
