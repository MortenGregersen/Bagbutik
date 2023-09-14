import Bagbutik_Core
import Foundation

/**
 # GameCenterAchievementsResponse
 A response that contains a list of Game Center achievement resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementsresponse>
 */
public struct GameCenterAchievementsResponse: Codable, PagedResponse {
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

    public func getGroupAchievement(for gameCenterAchievement: GameCenterAchievement) -> GameCenterAchievement? {
        included?.compactMap { relationship -> GameCenterAchievement? in
            guard case let .gameCenterAchievement(groupAchievement) = relationship else { return nil }
            return groupAchievement
        }.first { $0.id == gameCenterAchievement.relationships?.groupAchievement?.data?.id }
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

    public enum Included: Codable {
        case gameCenterAchievement(GameCenterAchievement)
        case gameCenterAchievementLocalization(GameCenterAchievementLocalization)
        case gameCenterAchievementRelease(GameCenterAchievementRelease)
        case gameCenterDetail(GameCenterDetail)
        case gameCenterGroup(GameCenterGroup)

        public init(from decoder: Decoder) throws {
            if let gameCenterAchievement = try? GameCenterAchievement(from: decoder) {
                self = .gameCenterAchievement(gameCenterAchievement)
            } else if let gameCenterAchievementLocalization = try? GameCenterAchievementLocalization(from: decoder) {
                self = .gameCenterAchievementLocalization(gameCenterAchievementLocalization)
            } else if let gameCenterAchievementRelease = try? GameCenterAchievementRelease(from: decoder) {
                self = .gameCenterAchievementRelease(gameCenterAchievementRelease)
            } else if let gameCenterDetail = try? GameCenterDetail(from: decoder) {
                self = .gameCenterDetail(gameCenterDetail)
            } else if let gameCenterGroup = try? GameCenterGroup(from: decoder) {
                self = .gameCenterGroup(gameCenterGroup)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
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
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterGroup(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
