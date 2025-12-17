import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterChallengesResponse
 A response that contains a list of Game Center challenge resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterchallengesresponse>
 */
public struct GameCenterChallengesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterChallenge

    public let data: [GameCenterChallenge]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterChallenge],
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
        data = try container.decode([GameCenterChallenge].self, forKey: "data")
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

    public func getGameCenterDetail(for gameCenterChallenge: GameCenterChallenge) -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == gameCenterChallenge.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterGroup(for gameCenterChallenge: GameCenterChallenge) -> GameCenterGroup? {
        included?.compactMap { relationship -> GameCenterGroup? in
            guard case let .gameCenterGroup(gameCenterGroup) = relationship else { return nil }
            return gameCenterGroup
        }.first { $0.id == gameCenterChallenge.relationships?.gameCenterGroup?.data?.id }
    }

    public func getLeaderboard(for gameCenterChallenge: GameCenterChallenge) -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(leaderboard) = relationship else { return nil }
            return leaderboard
        }.first { $0.id == gameCenterChallenge.relationships?.leaderboard?.data?.id }
    }

    public func getLeaderboardV2(for gameCenterChallenge: GameCenterChallenge) -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(leaderboardV2) = relationship else { return nil }
            return leaderboardV2
        }.first { $0.id == gameCenterChallenge.relationships?.leaderboardV2?.data?.id }
    }

    public func getVersions(for gameCenterChallenge: GameCenterChallenge) -> [GameCenterChallengeVersion] {
        guard let versionIds = gameCenterChallenge.relationships?.versions?.data?.map(\.id),
              let versions = included?.compactMap({ relationship -> GameCenterChallengeVersion? in
                  guard case let .gameCenterChallengeVersion(version) = relationship else { return nil }
                  return versionIds.contains(version.id) ? version : nil
              })
        else {
            return []
        }
        return versions
    }

    public enum Included: Codable, Sendable {
        case gameCenterChallengeVersion(GameCenterChallengeVersion)
        case gameCenterDetail(GameCenterDetail)
        case gameCenterGroup(GameCenterGroup)
        case gameCenterLeaderboard(GameCenterLeaderboard)

        public init(from decoder: Decoder) throws {
            if let gameCenterChallengeVersion = try? GameCenterChallengeVersion(from: decoder) {
                self = .gameCenterChallengeVersion(gameCenterChallengeVersion)
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
            case let .gameCenterChallengeVersion(value):
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
