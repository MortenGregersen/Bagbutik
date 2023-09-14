import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardSetMemberLocalizationsResponse
 A response that contains multiple leaderboard localizations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardsetmemberlocalizationsresponse>
 */
public struct GameCenterLeaderboardSetMemberLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = GameCenterLeaderboardSetMemberLocalization

    public let data: [GameCenterLeaderboardSetMemberLocalization]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterLeaderboardSetMemberLocalization],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getGameCenterLeaderboard(for gameCenterLeaderboardSetMemberLocalization: GameCenterLeaderboardSetMemberLocalization) -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(gameCenterLeaderboard) = relationship else { return nil }
            return gameCenterLeaderboard
        }.first { $0.id == gameCenterLeaderboardSetMemberLocalization.relationships?.gameCenterLeaderboard?.data?.id }
    }

    public func getGameCenterLeaderboardSet(for gameCenterLeaderboardSetMemberLocalization: GameCenterLeaderboardSetMemberLocalization) -> GameCenterLeaderboardSet? {
        included?.compactMap { relationship -> GameCenterLeaderboardSet? in
            guard case let .gameCenterLeaderboardSet(gameCenterLeaderboardSet) = relationship else { return nil }
            return gameCenterLeaderboardSet
        }.first { $0.id == gameCenterLeaderboardSetMemberLocalization.relationships?.gameCenterLeaderboardSet?.data?.id }
    }

    public enum Included: Codable {
        case gameCenterLeaderboard(GameCenterLeaderboard)
        case gameCenterLeaderboardSet(GameCenterLeaderboardSet)

        public init(from decoder: Decoder) throws {
            if let gameCenterLeaderboard = try? GameCenterLeaderboard(from: decoder) {
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
            case let .gameCenterLeaderboard(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSet(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
