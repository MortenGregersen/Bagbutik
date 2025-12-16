import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardVersionV2Response
 A response that contains a single Game Center leaderboard version resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardversionv2response>
 */
public struct GameCenterLeaderboardVersionV2Response: Codable, Sendable {
    public let data: GameCenterLeaderboardVersionV2
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardVersionV2,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterLeaderboardVersionV2.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getLeaderboard() -> GameCenterLeaderboardV2? {
        included?.compactMap { relationship -> GameCenterLeaderboardV2? in
            guard case let .gameCenterLeaderboardV2(leaderboard) = relationship else { return nil }
            return leaderboard
        }.first { $0.id == data.relationships?.leaderboard?.data?.id }
    }

    public func getLocalizations() -> [GameCenterLeaderboardLocalizationV2] {
        guard let localizationIds = data.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> GameCenterLeaderboardLocalizationV2? in
                  guard case let .gameCenterLeaderboardLocalizationV2(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public enum Included: Codable, Sendable {
        case gameCenterLeaderboardLocalizationV2(GameCenterLeaderboardLocalizationV2)
        case gameCenterLeaderboardV2(GameCenterLeaderboardV2)

        public init(from decoder: Decoder) throws {
            if let gameCenterLeaderboardLocalizationV2 = try? GameCenterLeaderboardLocalizationV2(from: decoder) {
                self = .gameCenterLeaderboardLocalizationV2(gameCenterLeaderboardLocalizationV2)
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
            case let .gameCenterLeaderboardLocalizationV2(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
