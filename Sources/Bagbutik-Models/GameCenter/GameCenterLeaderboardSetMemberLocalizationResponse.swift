import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardSetMemberLocalizationResponse
 A response that contains a single leaderboard set localization resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardsetmemberlocalizationresponse>
 */
public struct GameCenterLeaderboardSetMemberLocalizationResponse: Codable {
    public let data: GameCenterLeaderboardSetMemberLocalization
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardSetMemberLocalization,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterLeaderboardSetMemberLocalization.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getGameCenterLeaderboard() -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(gameCenterLeaderboard) = relationship else { return nil }
            return gameCenterLeaderboard
        }.first { $0.id == data.relationships?.gameCenterLeaderboard?.data?.id }
    }

    public func getGameCenterLeaderboardSet() -> GameCenterLeaderboardSet? {
        included?.compactMap { relationship -> GameCenterLeaderboardSet? in
            guard case let .gameCenterLeaderboardSet(gameCenterLeaderboardSet) = relationship else { return nil }
            return gameCenterLeaderboardSet
        }.first { $0.id == data.relationships?.gameCenterLeaderboardSet?.data?.id }
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
    }
}
