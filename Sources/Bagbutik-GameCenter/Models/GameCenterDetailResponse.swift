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

    public func getAchievementReleases() -> [GameCenterAchievementRelease] {
        guard let achievementReleaseIds = data.relationships?.achievementReleases?.data?.map(\.id),
              let achievementReleases = included?.compactMap({ relationship -> GameCenterAchievementRelease? in
                  guard case let .gameCenterAchievementRelease(achievementRelease) = relationship else { return nil }
                  return achievementReleaseIds.contains(achievementRelease.id) ? achievementRelease : nil
              })
        else {
            return []
        }
        return achievementReleases
    }

    public func getActivityReleases() -> [GameCenterActivityVersionRelease] {
        guard let activityReleaseIds = data.relationships?.activityReleases?.data?.map(\.id),
              let activityReleases = included?.compactMap({ relationship -> GameCenterActivityVersionRelease? in
                  guard case let .gameCenterActivityVersionRelease(activityRelease) = relationship else { return nil }
                  return activityReleaseIds.contains(activityRelease.id) ? activityRelease : nil
              })
        else {
            return []
        }
        return activityReleases
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getChallengeReleases() -> [GameCenterChallengeVersionRelease] {
        guard let challengeReleaseIds = data.relationships?.challengeReleases?.data?.map(\.id),
              let challengeReleases = included?.compactMap({ relationship -> GameCenterChallengeVersionRelease? in
                  guard case let .gameCenterChallengeVersionRelease(challengeRelease) = relationship else { return nil }
                  return challengeReleaseIds.contains(challengeRelease.id) ? challengeRelease : nil
              })
        else {
            return []
        }
        return challengeReleases
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

    public func getDefaultGroupLeaderboard() -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(defaultGroupLeaderboard) = relationship else { return nil }
            return defaultGroupLeaderboard
        }.first { $0.id == data.relationships?.defaultGroupLeaderboard?.data?.id }
    }

    public func getDefaultLeaderboard() -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(defaultLeaderboard) = relationship else { return nil }
            return defaultLeaderboard
        }.first { $0.id == data.relationships?.defaultLeaderboard?.data?.id }
    }

    public func getGameCenterAchievements() -> [GameCenterAchievement] {
        guard let gameCenterAchievementIds = data.relationships?.gameCenterAchievements?.data?.map(\.id),
              let gameCenterAchievements = included?.compactMap({ relationship -> GameCenterAchievement? in
                  guard case let .gameCenterAchievement(gameCenterAchievement) = relationship else { return nil }
                  return gameCenterAchievementIds.contains(gameCenterAchievement.id) ? gameCenterAchievement : nil
              })
        else {
            return []
        }
        return gameCenterAchievements
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

    public func getGameCenterLeaderboardSets() -> [GameCenterLeaderboardSet] {
        guard let gameCenterLeaderboardSetIds = data.relationships?.gameCenterLeaderboardSets?.data?.map(\.id),
              let gameCenterLeaderboardSets = included?.compactMap({ relationship -> GameCenterLeaderboardSet? in
                  guard case let .gameCenterLeaderboardSet(gameCenterLeaderboardSet) = relationship else { return nil }
                  return gameCenterLeaderboardSetIds.contains(gameCenterLeaderboardSet.id) ? gameCenterLeaderboardSet : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboardSets
    }

    public func getGameCenterLeaderboards() -> [GameCenterLeaderboard] {
        guard let gameCenterLeaderboardIds = data.relationships?.gameCenterLeaderboards?.data?.map(\.id),
              let gameCenterLeaderboards = included?.compactMap({ relationship -> GameCenterLeaderboard? in
                  guard case let .gameCenterLeaderboard(gameCenterLeaderboard) = relationship else { return nil }
                  return gameCenterLeaderboardIds.contains(gameCenterLeaderboard.id) ? gameCenterLeaderboard : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboards
    }

    public func getLeaderboardReleases() -> [GameCenterLeaderboardRelease] {
        guard let leaderboardReleaseIds = data.relationships?.leaderboardReleases?.data?.map(\.id),
              let leaderboardReleases = included?.compactMap({ relationship -> GameCenterLeaderboardRelease? in
                  guard case let .gameCenterLeaderboardRelease(leaderboardRelease) = relationship else { return nil }
                  return leaderboardReleaseIds.contains(leaderboardRelease.id) ? leaderboardRelease : nil
              })
        else {
            return []
        }
        return leaderboardReleases
    }

    public func getLeaderboardSetReleases() -> [GameCenterLeaderboardSetRelease] {
        guard let leaderboardSetReleaseIds = data.relationships?.leaderboardSetReleases?.data?.map(\.id),
              let leaderboardSetReleases = included?.compactMap({ relationship -> GameCenterLeaderboardSetRelease? in
                  guard case let .gameCenterLeaderboardSetRelease(leaderboardSetRelease) = relationship else { return nil }
                  return leaderboardSetReleaseIds.contains(leaderboardSetRelease.id) ? leaderboardSetRelease : nil
              })
        else {
            return []
        }
        return leaderboardSetReleases
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
