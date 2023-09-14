import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardSetLocalizationsResponse
 A response that contains multiple leaderboard localizations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardsetlocalizationsresponse>
 */
public struct GameCenterLeaderboardSetLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = GameCenterLeaderboardSetLocalization

    public let data: [GameCenterLeaderboardSetLocalization]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterLeaderboardSetLocalization],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getGameCenterLeaderboardSet(for gameCenterLeaderboardSetLocalization: GameCenterLeaderboardSetLocalization) -> GameCenterLeaderboardSet? {
        included?.compactMap { relationship -> GameCenterLeaderboardSet? in
            guard case let .gameCenterLeaderboardSet(gameCenterLeaderboardSet) = relationship else { return nil }
            return gameCenterLeaderboardSet
        }.first { $0.id == gameCenterLeaderboardSetLocalization.relationships?.gameCenterLeaderboardSet?.data?.id }
    }

    public func getGameCenterLeaderboardSetImage(for gameCenterLeaderboardSetLocalization: GameCenterLeaderboardSetLocalization) -> GameCenterLeaderboardSetImage? {
        included?.compactMap { relationship -> GameCenterLeaderboardSetImage? in
            guard case let .gameCenterLeaderboardSetImage(gameCenterLeaderboardSetImage) = relationship else { return nil }
            return gameCenterLeaderboardSetImage
        }.first { $0.id == gameCenterLeaderboardSetLocalization.relationships?.gameCenterLeaderboardSetImage?.data?.id }
    }

    public enum Included: Codable {
        case gameCenterLeaderboardSet(GameCenterLeaderboardSet)
        case gameCenterLeaderboardSetImage(GameCenterLeaderboardSetImage)

        public init(from decoder: Decoder) throws {
            if let gameCenterLeaderboardSet = try? GameCenterLeaderboardSet(from: decoder) {
                self = .gameCenterLeaderboardSet(gameCenterLeaderboardSet)
            } else if let gameCenterLeaderboardSetImage = try? GameCenterLeaderboardSetImage(from: decoder) {
                self = .gameCenterLeaderboardSetImage(gameCenterLeaderboardSetImage)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterLeaderboardSet(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSetImage(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
