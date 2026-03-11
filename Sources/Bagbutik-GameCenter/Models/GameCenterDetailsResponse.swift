import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterDetailsResponse
 A response that contains a list of Game Center detail resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterdetailsresponse>
 */
public struct GameCenterDetailsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterDetail

    public let data: [GameCenterDetail]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterDetail],
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
        data = try container.decode([GameCenterDetail].self, forKey: "data")
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

    public func getApp(for gameCenterDetail: GameCenterDetail) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == gameCenterDetail.relationships?.app?.data?.id }
    }

    public func getChallengesMinimumPlatformVersions(for gameCenterDetail: GameCenterDetail) -> [AppStoreVersion] {
        guard let challengesMinimumPlatformVersionIds = gameCenterDetail.relationships?.challengesMinimumPlatformVersions?.data?.map(\.id),
              let challengesMinimumPlatformVersions = included?.compactMap({ relationship -> AppStoreVersion? in
                  guard case let .appStoreVersion(challengesMinimumPlatformVersion) = relationship else { return nil }
                  return challengesMinimumPlatformVersionIds.contains(challengesMinimumPlatformVersion.id) ? challengesMinimumPlatformVersion : nil
              })
        else {
            return []
        }
        return challengesMinimumPlatformVersions
    }

    public func getDefaultGroupLeaderboardV2(for gameCenterDetail: GameCenterDetail) -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(defaultGroupLeaderboardV2) = relationship else { return nil }
            return defaultGroupLeaderboardV2
        }.first { $0.id == gameCenterDetail.relationships?.defaultGroupLeaderboardV2?.data?.id }
    }

    public func getDefaultLeaderboardV2(for gameCenterDetail: GameCenterDetail) -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(defaultLeaderboardV2) = relationship else { return nil }
            return defaultLeaderboardV2
        }.first { $0.id == gameCenterDetail.relationships?.defaultLeaderboardV2?.data?.id }
    }

    public func getGameCenterAchievementsV2(for gameCenterDetail: GameCenterDetail) -> [GameCenterAchievement] {
        guard let gameCenterAchievementsV2Ids = gameCenterDetail.relationships?.gameCenterAchievementsV2?.data?.map(\.id),
              let gameCenterAchievementsV2 = included?.compactMap({ relationship -> GameCenterAchievement? in
                  guard case let .gameCenterAchievement(gameCenterAchievementsV2) = relationship else { return nil }
                  return gameCenterAchievementsV2Ids.contains(gameCenterAchievementsV2.id) ? gameCenterAchievementsV2 : nil
              })
        else {
            return []
        }
        return gameCenterAchievementsV2
    }

    public func getGameCenterActivities(for gameCenterDetail: GameCenterDetail) -> [GameCenterActivity] {
        guard let gameCenterActivityIds = gameCenterDetail.relationships?.gameCenterActivities?.data?.map(\.id),
              let gameCenterActivities = included?.compactMap({ relationship -> GameCenterActivity? in
                  guard case let .gameCenterActivity(gameCenterActivity) = relationship else { return nil }
                  return gameCenterActivityIds.contains(gameCenterActivity.id) ? gameCenterActivity : nil
              })
        else {
            return []
        }
        return gameCenterActivities
    }

    public func getGameCenterAppVersions(for gameCenterDetail: GameCenterDetail) -> [GameCenterAppVersion] {
        guard let gameCenterAppVersionIds = gameCenterDetail.relationships?.gameCenterAppVersions?.data?.map(\.id),
              let gameCenterAppVersions = included?.compactMap({ relationship -> GameCenterAppVersion? in
                  guard case let .gameCenterAppVersion(gameCenterAppVersion) = relationship else { return nil }
                  return gameCenterAppVersionIds.contains(gameCenterAppVersion.id) ? gameCenterAppVersion : nil
              })
        else {
            return []
        }
        return gameCenterAppVersions
    }

    public func getGameCenterChallenges(for gameCenterDetail: GameCenterDetail) -> [GameCenterChallenge] {
        guard let gameCenterChallengeIds = gameCenterDetail.relationships?.gameCenterChallenges?.data?.map(\.id),
              let gameCenterChallenges = included?.compactMap({ relationship -> GameCenterChallenge? in
                  guard case let .gameCenterChallenge(gameCenterChallenge) = relationship else { return nil }
                  return gameCenterChallengeIds.contains(gameCenterChallenge.id) ? gameCenterChallenge : nil
              })
        else {
            return []
        }
        return gameCenterChallenges
    }

    public func getGameCenterGroup(for gameCenterDetail: GameCenterDetail) -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == gameCenterDetail.relationships?.gameCenterGroup?.data?.id }
    }

    public func getGameCenterLeaderboardSetsV2(for gameCenterDetail: GameCenterDetail) -> [GameCenterLeaderboardSet] {
        guard let gameCenterLeaderboardSetsV2Ids = gameCenterDetail.relationships?.gameCenterLeaderboardSetsV2?.data?.map(\.id),
              let gameCenterLeaderboardSetsV2 = included?.compactMap({ relationship -> GameCenterLeaderboardSet? in
                  guard case let .gameCenterLeaderboardSet(gameCenterLeaderboardSetsV2) = relationship else { return nil }
                  return gameCenterLeaderboardSetsV2Ids.contains(gameCenterLeaderboardSetsV2.id) ? gameCenterLeaderboardSetsV2 : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboardSetsV2
    }

    public func getGameCenterLeaderboardsV2(for gameCenterDetail: GameCenterDetail) -> [GameCenterLeaderboard] {
        guard let gameCenterLeaderboardsV2Ids = gameCenterDetail.relationships?.gameCenterLeaderboardsV2?.data?.map(\.id),
              let gameCenterLeaderboardsV2 = included?.compactMap({ relationship -> GameCenterLeaderboard? in
                  guard case let .gameCenterLeaderboard(gameCenterLeaderboardsV2) = relationship else { return nil }
                  return gameCenterLeaderboardsV2Ids.contains(gameCenterLeaderboardsV2.id) ? gameCenterLeaderboardsV2 : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboardsV2
    }

    public enum Included: Codable, Sendable {
        case app(App)
        case appStoreVersion(AppStoreVersion)
        case gameCenterAchievement(GameCenterAchievement)
        case gameCenterAchievementRelease(GameCenterAchievementRelease)
        case gameCenterActivity(GameCenterActivity)
        case gameCenterActivityVersionRelease(GameCenterActivityVersionRelease)
        case gameCenterAppVersion(GameCenterAppVersion)
        case gameCenterChallenge(GameCenterChallenge)
        case gameCenterChallengeVersionRelease(GameCenterChallengeVersionRelease)
        case gameCenterGroup(GameCenterGroup)
        case gameCenterLeaderboard(GameCenterLeaderboard)
        case gameCenterLeaderboardRelease(GameCenterLeaderboardRelease)
        case gameCenterLeaderboardSet(GameCenterLeaderboardSet)
        case gameCenterLeaderboardSetRelease(GameCenterLeaderboardSetRelease)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else if let gameCenterAchievement = try? GameCenterAchievement(from: decoder) {
                self = .gameCenterAchievement(gameCenterAchievement)
            } else if let gameCenterAchievementRelease = try? GameCenterAchievementRelease(from: decoder) {
                self = .gameCenterAchievementRelease(gameCenterAchievementRelease)
            } else if let gameCenterActivity = try? GameCenterActivity(from: decoder) {
                self = .gameCenterActivity(gameCenterActivity)
            } else if let gameCenterActivityVersionRelease = try? GameCenterActivityVersionRelease(from: decoder) {
                self = .gameCenterActivityVersionRelease(gameCenterActivityVersionRelease)
            } else if let gameCenterAppVersion = try? GameCenterAppVersion(from: decoder) {
                self = .gameCenterAppVersion(gameCenterAppVersion)
            } else if let gameCenterChallenge = try? GameCenterChallenge(from: decoder) {
                self = .gameCenterChallenge(gameCenterChallenge)
            } else if let gameCenterChallengeVersionRelease = try? GameCenterChallengeVersionRelease(from: decoder) {
                self = .gameCenterChallengeVersionRelease(gameCenterChallengeVersionRelease)
            } else if let gameCenterGroup = try? GameCenterGroup(from: decoder) {
                self = .gameCenterGroup(gameCenterGroup)
            } else if let gameCenterLeaderboard = try? GameCenterLeaderboard(from: decoder) {
                self = .gameCenterLeaderboard(gameCenterLeaderboard)
            } else if let gameCenterLeaderboardRelease = try? GameCenterLeaderboardRelease(from: decoder) {
                self = .gameCenterLeaderboardRelease(gameCenterLeaderboardRelease)
            } else if let gameCenterLeaderboardSet = try? GameCenterLeaderboardSet(from: decoder) {
                self = .gameCenterLeaderboardSet(gameCenterLeaderboardSet)
            } else if let gameCenterLeaderboardSetRelease = try? GameCenterLeaderboardSetRelease(from: decoder) {
                self = .gameCenterLeaderboardSetRelease(gameCenterLeaderboardSetRelease)
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
            case let .app(value):
                try value.encode(to: encoder)
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            case let .gameCenterAchievement(value):
                try value.encode(to: encoder)
            case let .gameCenterAchievementRelease(value):
                try value.encode(to: encoder)
            case let .gameCenterActivity(value):
                try value.encode(to: encoder)
            case let .gameCenterActivityVersionRelease(value):
                try value.encode(to: encoder)
            case let .gameCenterAppVersion(value):
                try value.encode(to: encoder)
            case let .gameCenterChallenge(value):
                try value.encode(to: encoder)
            case let .gameCenterChallengeVersionRelease(value):
                try value.encode(to: encoder)
            case let .gameCenterGroup(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboard(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardRelease(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSet(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSetRelease(value):
                try value.encode(to: encoder)
            }
        }
    }
}
