import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardSetVersionV2Response
 A response that contains a single Game Center leaderboard set version v2 resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardsetversionv2response>
 */
public struct GameCenterLeaderboardSetVersionV2Response: Codable, Sendable {
    public let data: GameCenterLeaderboardSetVersionV2
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardSetVersionV2,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterLeaderboardSetVersionV2.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getLeaderboardSet() -> GameCenterLeaderboardSetV2? {
        included?.compactMap { relationship -> GameCenterLeaderboardSetV2? in
            guard case let .gameCenterLeaderboardSetV2(leaderboardSet) = relationship else { return nil }
            return leaderboardSet
        }.first { $0.id == data.relationships?.leaderboardSet?.data?.id }
    }

    public func getLocalizations() -> [GameCenterLeaderboardSetLocalizationV2] {
        guard let localizationIds = data.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> GameCenterLeaderboardSetLocalizationV2? in
                  guard case let .gameCenterLeaderboardSetLocalizationV2(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public enum Included: Codable, Sendable {
        case gameCenterLeaderboardSetLocalizationV2(GameCenterLeaderboardSetLocalizationV2)
        case gameCenterLeaderboardSetV2(GameCenterLeaderboardSetV2)

        public init(from decoder: Decoder) throws {
            if let gameCenterLeaderboardSetLocalizationV2 = try? GameCenterLeaderboardSetLocalizationV2(from: decoder) {
                self = .gameCenterLeaderboardSetLocalizationV2(gameCenterLeaderboardSetLocalizationV2)
            } else if let gameCenterLeaderboardSetV2 = try? GameCenterLeaderboardSetV2(from: decoder) {
                self = .gameCenterLeaderboardSetV2(gameCenterLeaderboardSetV2)
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
            case let .gameCenterLeaderboardSetLocalizationV2(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSetV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
