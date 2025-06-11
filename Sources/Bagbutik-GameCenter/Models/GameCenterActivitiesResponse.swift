import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivitiesResponse
 A response that contains a list of activities resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivitiesresponse>
 */
public struct GameCenterActivitiesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterActivity

    public let data: [GameCenterActivity]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterActivity],
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
        data = try container.decode([GameCenterActivity].self, forKey: "data")
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

    public func getAchievements(for gameCenterActivity: GameCenterActivity) -> [GameCenterAchievement] {
        guard let achievementIds = gameCenterActivity.relationships?.achievements?.data?.map(\.id),
              let achievements = included?.compactMap({ relationship -> GameCenterAchievement? in
                  guard case let .gameCenterAchievement(achievement) = relationship else { return nil }
                  return achievementIds.contains(achievement.id) ? achievement : nil
              })
        else {
            return []
        }
        return achievements
    }

    public func getGameCenterDetail(for gameCenterActivity: GameCenterActivity) -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == gameCenterActivity.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterGroup(for gameCenterActivity: GameCenterActivity) -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == gameCenterActivity.relationships?.gameCenterGroup?.data?.id }
    }

    public func getLeaderboards(for gameCenterActivity: GameCenterActivity) -> [GameCenterLeaderboard] {
        guard let leaderboardIds = gameCenterActivity.relationships?.leaderboards?.data?.map(\.id),
              let leaderboards = included?.compactMap({ relationship -> GameCenterLeaderboard? in
                  guard case let .gameCenterLeaderboard(leaderboard) = relationship else { return nil }
                  return leaderboardIds.contains(leaderboard.id) ? leaderboard : nil
              })
        else {
            return []
        }
        return leaderboards
    }

    public func getVersions(for gameCenterActivity: GameCenterActivity) -> [GameCenterActivityVersion] {
        guard let versionIds = gameCenterActivity.relationships?.versions?.data?.map(\.id),
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
