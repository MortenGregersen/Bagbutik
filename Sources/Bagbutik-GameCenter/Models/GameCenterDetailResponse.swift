import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterDetailResponse
 A response that contains a single Game Center detail resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterdetailresponse>
 */
public struct GameCenterDetailResponse: Codable, Sendable {
    public let data: GameCenterDetail
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterDetail,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterDetail.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getChallengesMinimumPlatformVersions() -> [AppStoreVersion] {
        guard let challengesMinimumPlatformVersionIds = data.relationships?.challengesMinimumPlatformVersions?.data?.map(\.id),
              let challengesMinimumPlatformVersions = included?.compactMap({ relationship -> AppStoreVersion? in
                  guard case let .appStoreVersion(challengesMinimumPlatformVersion) = relationship else { return nil }
                  return challengesMinimumPlatformVersionIds.contains(challengesMinimumPlatformVersion.id) ? challengesMinimumPlatformVersion : nil
              })
        else {
            return []
        }
        return challengesMinimumPlatformVersions
    }

    public func getDefaultGroupLeaderboardV2() -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(defaultGroupLeaderboardV2) = relationship else { return nil }
            return defaultGroupLeaderboardV2
        }.first { $0.id == data.relationships?.defaultGroupLeaderboardV2?.data?.id }
    }

    public func getDefaultLeaderboardV2() -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(defaultLeaderboardV2) = relationship else { return nil }
            return defaultLeaderboardV2
        }.first { $0.id == data.relationships?.defaultLeaderboardV2?.data?.id }
    }

    public func getGameCenterAchievementsV2() -> [GameCenterAchievement] {
        guard let gameCenterAchievementsV2Ids = data.relationships?.gameCenterAchievementsV2?.data?.map(\.id),
              let gameCenterAchievementsV2 = included?.compactMap({ relationship -> GameCenterAchievement? in
                  guard case let .gameCenterAchievement(gameCenterAchievementsV2) = relationship else { return nil }
                  return gameCenterAchievementsV2Ids.contains(gameCenterAchievementsV2.id) ? gameCenterAchievementsV2 : nil
              })
        else {
            return []
        }
        return gameCenterAchievementsV2
    }

    public func getGameCenterActivities() -> [GameCenterActivity] {
        guard let gameCenterActivityIds = data.relationships?.gameCenterActivities?.data?.map(\.id),
              let gameCenterActivities = included?.compactMap({ relationship -> GameCenterActivity? in
                  guard case let .gameCenterActivity(gameCenterActivity) = relationship else { return nil }
                  return gameCenterActivityIds.contains(gameCenterActivity.id) ? gameCenterActivity : nil
              })
        else {
            return []
        }
        return gameCenterActivities
    }

    public func getGameCenterAppVersions() -> [GameCenterAppVersion] {
        guard let gameCenterAppVersionIds = data.relationships?.gameCenterAppVersions?.data?.map(\.id),
              let gameCenterAppVersions = included?.compactMap({ relationship -> GameCenterAppVersion? in
                  guard case let .gameCenterAppVersion(gameCenterAppVersion) = relationship else { return nil }
                  return gameCenterAppVersionIds.contains(gameCenterAppVersion.id) ? gameCenterAppVersion : nil
              })
        else {
            return []
        }
        return gameCenterAppVersions
    }

    public func getGameCenterChallenges() -> [GameCenterChallenge] {
        guard let gameCenterChallengeIds = data.relationships?.gameCenterChallenges?.data?.map(\.id),
              let gameCenterChallenges = included?.compactMap({ relationship -> GameCenterChallenge? in
                  guard case let .gameCenterChallenge(gameCenterChallenge) = relationship else { return nil }
                  return gameCenterChallengeIds.contains(gameCenterChallenge.id) ? gameCenterChallenge : nil
              })
        else {
            return []
        }
        return gameCenterChallenges
    }

    public func getGameCenterGroup() -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == data.relationships?.gameCenterGroup?.data?.id }
    }

    public func getGameCenterLeaderboardSetsV2() -> [GameCenterLeaderboardSet] {
        guard let gameCenterLeaderboardSetsV2Ids = data.relationships?.gameCenterLeaderboardSetsV2?.data?.map(\.id),
              let gameCenterLeaderboardSetsV2 = included?.compactMap({ relationship -> GameCenterLeaderboardSet? in
                  guard case let .gameCenterLeaderboardSet(gameCenterLeaderboardSetsV2) = relationship else { return nil }
                  return gameCenterLeaderboardSetsV2Ids.contains(gameCenterLeaderboardSetsV2.id) ? gameCenterLeaderboardSetsV2 : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboardSetsV2
    }

    public func getGameCenterLeaderboardsV2() -> [GameCenterLeaderboard] {
        guard let gameCenterLeaderboardsV2Ids = data.relationships?.gameCenterLeaderboardsV2?.data?.map(\.id),
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
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "apps":
                self = .app(try App(from: decoder))
            case "appStoreVersions":
                self = .appStoreVersion(try AppStoreVersion(from: decoder))
            case "gameCenterAchievements":
                self = .gameCenterAchievement(try GameCenterAchievement(from: decoder))
            case "gameCenterAchievementReleases":
                self = .gameCenterAchievementRelease(try GameCenterAchievementRelease(from: decoder))
            case "gameCenterActivities":
                self = .gameCenterActivity(try GameCenterActivity(from: decoder))
            case "gameCenterActivityVersionReleases":
                self = .gameCenterActivityVersionRelease(try GameCenterActivityVersionRelease(from: decoder))
            case "gameCenterAppVersions":
                self = .gameCenterAppVersion(try GameCenterAppVersion(from: decoder))
            case "gameCenterChallenges":
                self = .gameCenterChallenge(try GameCenterChallenge(from: decoder))
            case "gameCenterChallengeVersionReleases":
                self = .gameCenterChallengeVersionRelease(try GameCenterChallengeVersionRelease(from: decoder))
            case "gameCenterGroups":
                self = .gameCenterGroup(try GameCenterGroup(from: decoder))
            case "gameCenterLeaderboards":
                self = .gameCenterLeaderboard(try GameCenterLeaderboard(from: decoder))
            case "gameCenterLeaderboardReleases":
                self = .gameCenterLeaderboardRelease(try GameCenterLeaderboardRelease(from: decoder))
            case "gameCenterLeaderboardSets":
                self = .gameCenterLeaderboardSet(try GameCenterLeaderboardSet(from: decoder))
            case "gameCenterLeaderboardSetReleases":
                self = .gameCenterLeaderboardSetRelease(try GameCenterLeaderboardSetRelease(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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
