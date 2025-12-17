import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivityResponse
 A response that contains a single activity resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivityresponse>
 */
public struct GameCenterActivityResponse: Codable, Sendable {
    public let data: GameCenterActivity
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterActivity,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterActivity.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAchievements() -> [GameCenterAchievement] {
        guard let achievementIds = data.relationships?.achievements?.data?.map(\.id),
              let achievements = included?.compactMap({ relationship -> GameCenterAchievement? in
                  guard case let .gameCenterAchievement(achievement) = relationship else { return nil }
                  return achievementIds.contains(achievement.id) ? achievement : nil
              })
        else {
            return []
        }
        return achievements
    }

    public func getAchievementsV2() -> [GameCenterAchievement] {
        guard let achievementsV2Ids = data.relationships?.achievementsV2?.data?.map(\.id),
              let achievementsV2 = included?.compactMap({ relationship -> GameCenterAchievement? in
                  guard case let .gameCenterAchievement(achievementsV2) = relationship else { return nil }
                  return achievementsV2Ids.contains(achievementsV2.id) ? achievementsV2 : nil
              })
        else {
            return []
        }
        return achievementsV2
    }

    public func getGameCenterDetail() -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == data.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterGroup() -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == data.relationships?.gameCenterGroup?.data?.id }
    }

    public func getLeaderboards() -> [GameCenterLeaderboard] {
        guard let leaderboardIds = data.relationships?.leaderboards?.data?.map(\.id),
              let leaderboards = included?.compactMap({ relationship -> GameCenterLeaderboard? in
                  guard case let .gameCenterLeaderboard(leaderboard) = relationship else { return nil }
                  return leaderboardIds.contains(leaderboard.id) ? leaderboard : nil
              })
        else {
            return []
        }
        return leaderboards
    }

    public func getLeaderboardsV2() -> [GameCenterLeaderboard] {
        guard let leaderboardsV2Ids = data.relationships?.leaderboardsV2?.data?.map(\.id),
              let leaderboardsV2 = included?.compactMap({ relationship -> GameCenterLeaderboard? in
                  guard case let .gameCenterLeaderboard(leaderboardsV2) = relationship else { return nil }
                  return leaderboardsV2Ids.contains(leaderboardsV2.id) ? leaderboardsV2 : nil
              })
        else {
            return []
        }
        return leaderboardsV2
    }

    public func getVersions() -> [GameCenterActivityVersion] {
        guard let versionIds = data.relationships?.versions?.data?.map(\.id),
              let versions = included?.compactMap({ relationship -> GameCenterActivityVersion? in
                  guard case let .gameCenterActivityVersion(version) = relationship else { return nil }
                  return versionIds.contains(version.id) ? version : nil
              })
        else {
            return []
        }
        return versions
    }

    public enum Included: Codable, Sendable {
        case gameCenterAchievement(GameCenterAchievement)
        case gameCenterActivityVersion(GameCenterActivityVersion)
        case gameCenterDetail(GameCenterDetail)
        case gameCenterGroup(GameCenterGroup)
        case gameCenterLeaderboard(GameCenterLeaderboard)

        public init(from decoder: Decoder) throws {
            if let gameCenterAchievement = try? GameCenterAchievement(from: decoder) {
                self = .gameCenterAchievement(gameCenterAchievement)
            } else if let gameCenterActivityVersion = try? GameCenterActivityVersion(from: decoder) {
                self = .gameCenterActivityVersion(gameCenterActivityVersion)
            } else if let gameCenterDetail = try? GameCenterDetail(from: decoder) {
                self = .gameCenterDetail(gameCenterDetail)
            } else if let gameCenterGroup = try? GameCenterGroup(from: decoder) {
                self = .gameCenterGroup(gameCenterGroup)
            } else if let gameCenterLeaderboard = try? GameCenterLeaderboard(from: decoder) {
                self = .gameCenterLeaderboard(gameCenterLeaderboard)
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
            case let .gameCenterAchievement(value):
                try value.encode(to: encoder)
            case let .gameCenterActivityVersion(value):
                try value.encode(to: encoder)
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterGroup(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboard(value):
                try value.encode(to: encoder)
            }
        }
    }
}
