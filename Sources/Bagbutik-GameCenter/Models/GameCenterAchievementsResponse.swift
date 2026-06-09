import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterAchievementsResponse
 A response that contains a list of Game Center achievement resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementsresponse>
 */
public struct GameCenterAchievementsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterAchievement

    public let data: [GameCenterAchievement]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterAchievement],
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
        data = try container.decode([GameCenterAchievement].self, forKey: "data")
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

    public func getActivity(for gameCenterAchievement: GameCenterAchievement) -> GameCenterActivity? {
        included?.compactMap { relationship -> GameCenterActivity? in
            guard case let .gameCenterActivity(activity) = relationship else { return nil }
            return activity
        }.first { $0.id == gameCenterAchievement.relationships?.activity?.data?.id }
    }

    public func getGameCenterDetail(for gameCenterAchievement: GameCenterAchievement) -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == gameCenterAchievement.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterGroup(for gameCenterAchievement: GameCenterAchievement) -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == gameCenterAchievement.relationships?.gameCenterGroup?.data?.id }
    }

    public func getLocalizations(for gameCenterAchievement: GameCenterAchievement) -> [GameCenterAchievementLocalization] {
        guard let localizationIds = gameCenterAchievement.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> GameCenterAchievementLocalization? in
                  guard case let .gameCenterAchievementLocalization(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public func getReleases(for gameCenterAchievement: GameCenterAchievement) -> [GameCenterAchievementRelease] {
        guard let releaseIds = gameCenterAchievement.relationships?.releases?.data?.map(\.id),
              let releases = included?.compactMap({ relationship -> GameCenterAchievementRelease? in
                  guard case let .gameCenterAchievementRelease(release) = relationship else { return nil }
                  return releaseIds.contains(release.id) ? release : nil
              })
        else {
            return []
        }
        return releases
    }

    public enum Included: Codable, Sendable {
        case gameCenterAchievement(GameCenterAchievement)
        case gameCenterAchievementLocalization(GameCenterAchievementLocalization)
        case gameCenterAchievementRelease(GameCenterAchievementRelease)
        case gameCenterActivity(GameCenterActivity)
        case gameCenterDetail(GameCenterDetail)
        case gameCenterGroup(GameCenterGroup)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "gameCenterAchievements":
                self = .gameCenterAchievement(try GameCenterAchievement(from: decoder))
            case "gameCenterAchievementLocalizations":
                self = .gameCenterAchievementLocalization(try GameCenterAchievementLocalization(from: decoder))
            case "gameCenterAchievementReleases":
                self = .gameCenterAchievementRelease(try GameCenterAchievementRelease(from: decoder))
            case "gameCenterActivities":
                self = .gameCenterActivity(try GameCenterActivity(from: decoder))
            case "gameCenterDetails":
                self = .gameCenterDetail(try GameCenterDetail(from: decoder))
            case "gameCenterGroups":
                self = .gameCenterGroup(try GameCenterGroup(from: decoder))
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
            case let .gameCenterAchievementLocalization(value):
                try value.encode(to: encoder)
            case let .gameCenterAchievementRelease(value):
                try value.encode(to: encoder)
            case let .gameCenterActivity(value):
                try value.encode(to: encoder)
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterGroup(value):
                try value.encode(to: encoder)
            }
        }
    }
}
