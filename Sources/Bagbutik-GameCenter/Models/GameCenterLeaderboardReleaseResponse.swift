import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardReleaseResponse
 The response body for endpoints that create, read, or modify a single Game Center leaderboard release.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardreleaseresponse>
 */
public struct GameCenterLeaderboardReleaseResponse: Codable, Sendable {
    public let data: GameCenterLeaderboardRelease
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardRelease,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterLeaderboardRelease.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getGameCenterDetail() -> GameCenterDetail? {
        included?.compactMap { relationship -> GameCenterDetail? in
            guard case let .gameCenterDetail(gameCenterDetail) = relationship else { return nil }
            return gameCenterDetail
        }.first { $0.id == data.relationships?.gameCenterDetail?.data?.id }
    }

    public func getGameCenterLeaderboard() -> GameCenterLeaderboard? {
        included?.compactMap { relationship -> GameCenterLeaderboard? in
            guard case let .gameCenterLeaderboard(gameCenterLeaderboard) = relationship else { return nil }
            return gameCenterLeaderboard
        }.first { $0.id == data.relationships?.gameCenterLeaderboard?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case gameCenterDetail(GameCenterDetail)
        case gameCenterLeaderboard(GameCenterLeaderboard)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "gameCenterDetails":
                self = .gameCenterDetail(try GameCenterDetail(from: decoder))
            case "gameCenterLeaderboards":
                self = .gameCenterLeaderboard(try GameCenterLeaderboard(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterDetail(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboard(value):
                try value.encode(to: encoder)
            }
        }
    }
}
