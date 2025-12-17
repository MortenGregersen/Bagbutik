import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardsV2Response
 A response that contains a list of Game Center leaderboard resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardsv2response>
 */
public struct GameCenterLeaderboardsV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterLeaderboardV2

    public let data: [GameCenterLeaderboardV2]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterLeaderboardV2],
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
        data = try container.decode([GameCenterLeaderboardV2].self, forKey: "data")
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

    public func getActivity(for gameCenterLeaderboardV2: GameCenterLeaderboardV2) -> GameCenterActivity? {
        included?.compactMap { relationship -> GameCenterActivity? in
            guard case let .gameCenterActivity(activity) = relationship else { return nil }
            return activity
        }.first { $0.id == gameCenterLeaderboardV2.relationships?.activity?.data?.id }
    }

    public func getChallenge(for gameCenterLeaderboardV2: GameCenterLeaderboardV2) -> GameCenterChallenge? {
        included?.compactMap { relationship -> GameCenterChallenge? in
            guard case let .gameCenterChallenge(challenge) = relationship else { return nil }
            return challenge
        }.first { $0.id == gameCenterLeaderboardV2.relationships?.challenge?.data?.id }
    }

    public func getGameCenterDetail(for gameCenterLeaderboardV2: GameCenterLeaderboardV2) -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == gameCenterLeaderboardV2.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterGroup(for gameCenterLeaderboardV2: GameCenterLeaderboardV2) -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == gameCenterLeaderboardV2.relationships?.gameCenterGroup?.data?.id }
    }

    public func getGameCenterLeaderboardSets(for gameCenterLeaderboardV2: GameCenterLeaderboardV2) -> [GameCenterLeaderboardSetV2] {
        guard let gameCenterLeaderboardSetIds = gameCenterLeaderboardV2.relationships?.gameCenterLeaderboardSets?.data?.map(\.id),
              let gameCenterLeaderboardSets = included?.compactMap({ relationship -> GameCenterLeaderboardSetV2? in
                  guard case let .gameCenterLeaderboardSetV2(gameCenterLeaderboardSet) = relationship else { return nil }
                  return gameCenterLeaderboardSetIds.contains(gameCenterLeaderboardSet.id) ? gameCenterLeaderboardSet : nil
              })
        else {
            return []
        }
        return gameCenterLeaderboardSets
    }

    public func getVersions(for gameCenterLeaderboardV2: GameCenterLeaderboardV2) -> [GameCenterLeaderboardVersionV2] {
        guard let versionIds = gameCenterLeaderboardV2.relationships?.versions?.data?.map(\.id),
              let versions = included?.compactMap({ relationship -> GameCenterLeaderboardVersionV2? in
                  guard case let .gameCenterLeaderboardVersionV2(version) = relationship else { return nil }
                  return versionIds.contains(version.id) ? version : nil
              })
        else {
            return []
        }
        return versions
    }

    public enum Included: Codable, Sendable {
        case gameCenterActivity(GameCenterActivity)
        case gameCenterChallenge(GameCenterChallenge)
        case gameCenterDetail(GameCenterDetail)
        case gameCenterGroup(GameCenterGroup)
        case gameCenterLeaderboardSetV2(GameCenterLeaderboardSetV2)
        case gameCenterLeaderboardVersionV2(GameCenterLeaderboardVersionV2)

        public init(from decoder: Decoder) throws {
            if let gameCenterActivity = try? GameCenterActivity(from: decoder) {
                self = .gameCenterActivity(gameCenterActivity)
            } else if let gameCenterChallenge = try? GameCenterChallenge(from: decoder) {
                self = .gameCenterChallenge(gameCenterChallenge)
            } else if let gameCenterDetail = try? GameCenterDetail(from: decoder) {
                self = .gameCenterDetail(gameCenterDetail)
            } else if let gameCenterGroup = try? GameCenterGroup(from: decoder) {
                self = .gameCenterGroup(gameCenterGroup)
            } else if let gameCenterLeaderboardSetV2 = try? GameCenterLeaderboardSetV2(from: decoder) {
                self = .gameCenterLeaderboardSetV2(gameCenterLeaderboardSetV2)
            } else if let gameCenterLeaderboardVersionV2 = try? GameCenterLeaderboardVersionV2(from: decoder) {
                self = .gameCenterLeaderboardVersionV2(gameCenterLeaderboardVersionV2)
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
            case let .gameCenterActivity(value):
                try value.encode(to: encoder)
            case let .gameCenterChallenge(value):
                try value.encode(to: encoder)
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterGroup(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSetV2(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardVersionV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
