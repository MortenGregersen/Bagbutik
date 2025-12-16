import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterGroupResponse
 A response that contains a single group resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentergroupresponse>
 */
public struct GameCenterGroupResponse: Codable, Sendable {
    public let data: GameCenterGroup
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterGroup,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterGroup.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
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

    public func getGameCenterDetails() -> [GameCenterDetail] {
        guard let gameCenterDetailIds = data.relationships?.gameCenterDetails?.data?.map(\.id),
              let gameCenterDetails = included?.compactMap({ relationship -> GameCenterDetail? in
                  guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
                  return gameCenterDetailIds.contains(gameCenterDetail.id) ? gameCenterDetail : nil
              })
        else {
            return []
        }
        return gameCenterDetails
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
        case gameCenterAchievement(GameCenterAchievement)
        case gameCenterActivity(GameCenterActivity)
        case gameCenterChallenge(GameCenterChallenge)
        case gameCenterDetail(GameCenterDetail)
        case gameCenterLeaderboard(GameCenterLeaderboard)
        case gameCenterLeaderboardSet(GameCenterLeaderboardSet)

        public init(from decoder: Decoder) throws {
            if let gameCenterAchievement = try? GameCenterAchievement(from: decoder) {
                self = .gameCenterAchievement(gameCenterAchievement)
            } else if let gameCenterActivity = try? GameCenterActivity(from: decoder) {
                self = .gameCenterActivity(gameCenterActivity)
            } else if let gameCenterChallenge = try? GameCenterChallenge(from: decoder) {
                self = .gameCenterChallenge(gameCenterChallenge)
            } else if let gameCenterDetail = try? GameCenterDetail(from: decoder) {
                self = .gameCenterDetail(gameCenterDetail)
            } else if let gameCenterLeaderboard = try? GameCenterLeaderboard(from: decoder) {
                self = .gameCenterLeaderboard(gameCenterLeaderboard)
            } else if let gameCenterLeaderboardSet = try? GameCenterLeaderboardSet(from: decoder) {
                self = .gameCenterLeaderboardSet(gameCenterLeaderboardSet)
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
            case let .gameCenterActivity(value):
                try value.encode(to: encoder)
            case let .gameCenterChallenge(value):
                try value.encode(to: encoder)
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboard(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSet(value):
                try value.encode(to: encoder)
            }
        }
    }
}
