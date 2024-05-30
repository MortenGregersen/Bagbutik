import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardLocalizationsResponse
 A response that contains multiple leaderboard localizations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardlocalizationsresponse>
 */
public struct GameCenterLeaderboardLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = GameCenterLeaderboardLocalization

    public let data: [GameCenterLeaderboardLocalization]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterLeaderboardLocalization],
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([GameCenterLeaderboardLocalization].self, forKey: .data)
        included = try container.decodeIfPresent([Included].self, forKey: .included)
        links = try container.decode(PagedDocumentLinks.self, forKey: .links)
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(meta, forKey: .meta)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
        case meta
    }

    public func getGameCenterLeaderboard(for gameCenterLeaderboardLocalization: GameCenterLeaderboardLocalization) -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(gameCenterLeaderboard) = relationship else { return nil }
            return gameCenterLeaderboard
        }.first { $0.id == gameCenterLeaderboardLocalization.relationships?.gameCenterLeaderboard?.data?.id }
    }

    public func getGameCenterLeaderboardImage(for gameCenterLeaderboardLocalization: GameCenterLeaderboardLocalization) -> GameCenterLeaderboardImage? {
        included?.compactMap { relationship -> GameCenterLeaderboardImage? in
            guard case let .gameCenterLeaderboardImage(gameCenterLeaderboardImage) = relationship else { return nil }
            return gameCenterLeaderboardImage
        }.first { $0.id == gameCenterLeaderboardLocalization.relationships?.gameCenterLeaderboardImage?.data?.id }
    }

    public enum Included: Codable {
        case gameCenterLeaderboard(GameCenterLeaderboard)
        case gameCenterLeaderboardImage(GameCenterLeaderboardImage)

        public init(from decoder: Decoder) throws {
            if let gameCenterLeaderboard = try? GameCenterLeaderboard(from: decoder) {
                self = .gameCenterLeaderboard(gameCenterLeaderboard)
            } else if let gameCenterLeaderboardImage = try? GameCenterLeaderboardImage(from: decoder) {
                self = .gameCenterLeaderboardImage(gameCenterLeaderboardImage)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterLeaderboard(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardImage(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
