import Bagbutik_Core
import Foundation

public struct GameCenterGroupsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterGroup

    public let data: [GameCenterGroup]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterGroup],
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
        data = try container.decode([GameCenterGroup].self, forKey: "data")
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

    public func getGameCenterAchievements(for gameCenterGroup: GameCenterGroup) -> [GameCenterAchievement] {
        guard let gameCenterAchievementIds = gameCenterGroup.relationships?.gameCenterAchievements?.data?.map(\.id),
              let gameCenterAchievements = included?.compactMap({ relationship -> GameCenterAchievement? in
                  guard case let .gameCenterAchievement(gameCenterAchievement) = relationship else { return nil }
                  return gameCenterAchievementIds.contains(gameCenterAchievement.id) ? gameCenterAchievement : nil
              })
        else {
            return []
        }
        return gameCenterAchievements
    }

    public func getGameCenterDetails(for gameCenterGroup: GameCenterGroup) -> [GameCenterDetail] {
        guard let gameCenterDetailIds = gameCenterGroup.relationships?.gameCenterDetails?.data?.map(\.id),
              let gameCenterDetails = included?.compactMap({ relationship -> GameCenterDetail? in
                  guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
                  return gameCenterDetailIds.contains(gameCenterDetail.id) ? gameCenterDetail : nil
              })
        else {
            return []
        }
        return gameCenterDetails
    }

    public func getGameCenterLeaderboardSets(for gameCenterGroup: GameCenterGroup) -> [GameCenterLeaderboardSet] {
        guard let gameCenterLeaderboardSetIds = gameCenterGroup.relationships?.gameCenterLeaderboardSets?.data?.map(\.id),
              let gameCenterLeaderboardSets = included?.compactMap({ relationship -> GameCenterLeaderboardSet? in
                  guard case let .gameCenterLeaderboardSet(gameCenterLeaderboardSet) = relationship else { return nil }
                  return gameCenterLeaderboardSetIds.contains(gameCenterLeaderboardSet.id) ? gameCenterLeaderboardSet : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboardSets
    }

    public func getGameCenterLeaderboards(for gameCenterGroup: GameCenterGroup) -> [GameCenterLeaderboard] {
        guard let gameCenterLeaderboardIds = gameCenterGroup.relationships?.gameCenterLeaderboards?.data?.map(\.id),
              let gameCenterLeaderboards = included?.compactMap({ relationship -> GameCenterLeaderboard? in
                  guard case let .gameCenterLeaderboard(gameCenterLeaderboard) = relationship else { return nil }
                  return gameCenterLeaderboardIds.contains(gameCenterLeaderboard.id) ? gameCenterLeaderboard : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboards
    }

    public enum Included: Codable, Sendable {
        case gameCenterAchievement(GameCenterAchievement)
        case gameCenterDetail(GameCenterDetail)
        case gameCenterLeaderboard(GameCenterLeaderboard)
        case gameCenterLeaderboardSet(GameCenterLeaderboardSet)

        public init(from decoder: Decoder) throws {
            if let gameCenterAchievement = try? GameCenterAchievement(from: decoder) {
                self = .gameCenterAchievement(gameCenterAchievement)
            } else if let gameCenterDetail = try? GameCenterDetail(from: decoder) {
                self = .gameCenterDetail(gameCenterDetail)
            } else if let gameCenterLeaderboard = try? GameCenterLeaderboard(from: decoder) {
                self = .gameCenterLeaderboard(gameCenterLeaderboard)
            } else if let gameCenterLeaderboardSet = try? GameCenterLeaderboardSet(from: decoder) {
                self = .gameCenterLeaderboardSet(gameCenterLeaderboardSet)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterAchievement(value):
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
