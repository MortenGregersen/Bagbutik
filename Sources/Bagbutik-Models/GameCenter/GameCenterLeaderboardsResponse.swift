import Bagbutik_Core
import Foundation

public struct GameCenterLeaderboardsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterLeaderboard

    public let data: [GameCenterLeaderboard]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterLeaderboard],
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
        data = try container.decode([GameCenterLeaderboard].self, forKey: "data")
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

    public func getGameCenterDetail(for gameCenterLeaderboard: GameCenterLeaderboard) -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == gameCenterLeaderboard.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterGroup(for gameCenterLeaderboard: GameCenterLeaderboard) -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == gameCenterLeaderboard.relationships?.gameCenterGroup?.data?.id }
    }

    public func getGameCenterLeaderboardSets(for gameCenterLeaderboard: GameCenterLeaderboard) -> [GameCenterLeaderboardSet] {
        guard let gameCenterLeaderboardSetIds = gameCenterLeaderboard.relationships?.gameCenterLeaderboardSets?.data?.map(\.id),
              let gameCenterLeaderboardSets = included?.compactMap({ relationship -> GameCenterLeaderboardSet? in
                  guard case let .gameCenterLeaderboardSet(gameCenterLeaderboardSet) = relationship else { return nil }
                  return gameCenterLeaderboardSetIds.contains(gameCenterLeaderboardSet.id) ? gameCenterLeaderboardSet : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboardSets
    }

    public func getGroupLeaderboard(for gameCenterLeaderboard: GameCenterLeaderboard) -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(groupLeaderboard) = relationship else { return nil }
            return groupLeaderboard
        }.first { $0.id == gameCenterLeaderboard.relationships?.groupLeaderboard?.data?.id }
    }

    public func getLocalizations(for gameCenterLeaderboard: GameCenterLeaderboard) -> [GameCenterLeaderboardLocalization] {
        guard let localizationIds = gameCenterLeaderboard.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> GameCenterLeaderboardLocalization? in
                  guard case let .gameCenterLeaderboardLocalization(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public func getReleases(for gameCenterLeaderboard: GameCenterLeaderboard) -> [GameCenterLeaderboardRelease] {
        guard let releaseIds = gameCenterLeaderboard.relationships?.releases?.data?.map(\.id),
              let releases = included?.compactMap({ relationship -> GameCenterLeaderboardRelease? in
                  guard case let .gameCenterLeaderboardRelease(release) = relationship else { return nil }
                  return releaseIds.contains(release.id) ? release : nil
              })
        else {
            return []
        }
        return releases
    }

    public enum Included: Codable, Sendable {
        case gameCenterDetail(GameCenterDetail)
        case gameCenterGroup(GameCenterGroup)
        case gameCenterLeaderboard(GameCenterLeaderboard)
        case gameCenterLeaderboardLocalization(GameCenterLeaderboardLocalization)
        case gameCenterLeaderboardRelease(GameCenterLeaderboardRelease)
        case gameCenterLeaderboardSet(GameCenterLeaderboardSet)

        public init(from decoder: Decoder) throws {
            if let gameCenterDetail = try? GameCenterDetail(from: decoder) {
                self = .gameCenterDetail(gameCenterDetail)
            } else if let gameCenterGroup = try? GameCenterGroup(from: decoder) {
                self = .gameCenterGroup(gameCenterGroup)
            } else if let gameCenterLeaderboard = try? GameCenterLeaderboard(from: decoder) {
                self = .gameCenterLeaderboard(gameCenterLeaderboard)
            } else if let gameCenterLeaderboardLocalization = try? GameCenterLeaderboardLocalization(from: decoder) {
                self = .gameCenterLeaderboardLocalization(gameCenterLeaderboardLocalization)
            } else if let gameCenterLeaderboardRelease = try? GameCenterLeaderboardRelease(from: decoder) {
                self = .gameCenterLeaderboardRelease(gameCenterLeaderboardRelease)
            } else if let gameCenterLeaderboardSet = try? GameCenterLeaderboardSet(from: decoder) {
                self = .gameCenterLeaderboardSet(gameCenterLeaderboardSet)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterGroup(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboard(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardLocalization(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardRelease(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSet(value):
                try value.encode(to: encoder)
            }
        }
    }
}
