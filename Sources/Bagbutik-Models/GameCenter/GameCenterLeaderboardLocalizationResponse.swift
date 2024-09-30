import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardLocalizationResponse
 A response that contains a single leaderboard localization resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardlocalizationresponse>
 */
public struct GameCenterLeaderboardLocalizationResponse: Codable, Sendable {
    public let data: GameCenterLeaderboardLocalization
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardLocalization,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterLeaderboardLocalization.self, forKey: "data")
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

    public func getGameCenterLeaderboardImage() -> GameCenterLeaderboardImage? {
        included?.compactMap { relationship -> GameCenterLeaderboardImage? in
            guard case let .gameCenterLeaderboardImage(gameCenterLeaderboardImage) = relationship else { return nil }
            return gameCenterLeaderboardImage
        }.first { $0.id == data.relationships?.gameCenterLeaderboardImage?.data?.id }
    }

    public enum Included: Codable, Sendable {
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
    }
}
