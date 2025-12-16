import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterAchievementVersionsV2Response
 A response that contains a single Game Center achievement version v2 resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementversionsv2response>
 */
public struct GameCenterAchievementVersionsV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterAchievementVersionV2

    public let data: [GameCenterAchievementVersionV2]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterAchievementVersionV2],
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
        data = try container.decode([GameCenterAchievementVersionV2].self, forKey: "data")
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

    public func getAchievement(for gameCenterAchievementVersionV2: GameCenterAchievementVersionV2) -> GameCenterAchievementV2? {
        included?.compactMap { relationship -> GameCenterAchievementV2? in
            guard case let .gameCenterAchievementV2(achievement) = relationship else { return nil }
            return achievement
        }.first { $0.id == gameCenterAchievementVersionV2.relationships?.achievement?.data?.id }
    }

    public func getLocalizations(for gameCenterAchievementVersionV2: GameCenterAchievementVersionV2) -> [GameCenterAchievementLocalizationV2] {
        guard let localizationIds = gameCenterAchievementVersionV2.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> GameCenterAchievementLocalizationV2? in
                  guard case let .gameCenterAchievementLocalizationV2(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public enum Included: Codable, Sendable {
        case gameCenterAchievementLocalizationV2(GameCenterAchievementLocalizationV2)
        case gameCenterAchievementV2(GameCenterAchievementV2)

        public init(from decoder: Decoder) throws {
            if let gameCenterAchievementLocalizationV2 = try? GameCenterAchievementLocalizationV2(from: decoder) {
                self = .gameCenterAchievementLocalizationV2(gameCenterAchievementLocalizationV2)
            } else if let gameCenterAchievementV2 = try? GameCenterAchievementV2(from: decoder) {
                self = .gameCenterAchievementV2(gameCenterAchievementV2)
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
            case let .gameCenterAchievementLocalizationV2(value):
                try value.encode(to: encoder)
            case let .gameCenterAchievementV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
