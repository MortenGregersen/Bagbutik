import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardSetsV2Response
 A response that contains a single Game Center leaderboard set v2 resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardsetsv2response>
 */
public struct GameCenterLeaderboardSetsV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterLeaderboardSetV2

    public let data: [GameCenterLeaderboardSetV2]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterLeaderboardSetV2],
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
        data = try container.decode([GameCenterLeaderboardSetV2].self, forKey: "data")
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

    public func getGameCenterDetail(for gameCenterLeaderboardSetV2: GameCenterLeaderboardSetV2) -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == gameCenterLeaderboardSetV2.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterGroup(for gameCenterLeaderboardSetV2: GameCenterLeaderboardSetV2) -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == gameCenterLeaderboardSetV2.relationships?.gameCenterGroup?.data?.id }
    }

    public func getGameCenterLeaderboards(for gameCenterLeaderboardSetV2: GameCenterLeaderboardSetV2) -> [GameCenterLeaderboardV2] {
        guard let gameCenterLeaderboardIds = gameCenterLeaderboardSetV2.relationships?.gameCenterLeaderboards?.data?.map(\.id),
              let gameCenterLeaderboards = included?.compactMap({ relationship -> GameCenterLeaderboardV2? in
                  guard case let .gameCenterLeaderboardV2(gameCenterLeaderboard) = relationship else { return nil }
                  return gameCenterLeaderboardIds.contains(gameCenterLeaderboard.id) ? gameCenterLeaderboard : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboards
    }

    public func getVersions(for gameCenterLeaderboardSetV2: GameCenterLeaderboardSetV2) -> [GameCenterLeaderboardSetVersionV2] {
        guard let versionIds = gameCenterLeaderboardSetV2.relationships?.versions?.data?.map(\.id),
              let versions = included?.compactMap({ relationship -> GameCenterLeaderboardSetVersionV2? in
                  guard case let .gameCenterLeaderboardSetVersionV2(version) = relationship else { return nil }
                  return versionIds.contains(version.id) ? version : nil
              })
        else {
            return []
        }
        return versions
    }

    public enum Included: Codable, Sendable {
        case gameCenterDetail(GameCenterDetail)
        case gameCenterGroup(GameCenterGroup)
        case gameCenterLeaderboardSetVersionV2(GameCenterLeaderboardSetVersionV2)
        case gameCenterLeaderboardV2(GameCenterLeaderboardV2)

        public init(from decoder: Decoder) throws {
            if let gameCenterDetail = try? GameCenterDetail(from: decoder) {
                self = .gameCenterDetail(gameCenterDetail)
            } else if let gameCenterGroup = try? GameCenterGroup(from: decoder) {
                self = .gameCenterGroup(gameCenterGroup)
            } else if let gameCenterLeaderboardSetVersionV2 = try? GameCenterLeaderboardSetVersionV2(from: decoder) {
                self = .gameCenterLeaderboardSetVersionV2(gameCenterLeaderboardSetVersionV2)
            } else if let gameCenterLeaderboardV2 = try? GameCenterLeaderboardV2(from: decoder) {
                self = .gameCenterLeaderboardV2(gameCenterLeaderboardV2)
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
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterGroup(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSetVersionV2(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
