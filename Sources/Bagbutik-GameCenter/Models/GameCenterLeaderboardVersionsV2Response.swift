import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardVersionsV2Response
 A response that contains a list of Game Center leaderboard version resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardversionsv2response>
 */
public struct GameCenterLeaderboardVersionsV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterLeaderboardVersionV2

    public let data: [GameCenterLeaderboardVersionV2]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterLeaderboardVersionV2],
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
        data = try container.decode([GameCenterLeaderboardVersionV2].self, forKey: "data")
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

    public func getLeaderboard(for gameCenterLeaderboardVersionV2: GameCenterLeaderboardVersionV2) -> GameCenterLeaderboardV2? {
        included?.compactMap { relationship -> GameCenterLeaderboardV2? in
            guard case let .gameCenterLeaderboardV2(leaderboard) = relationship else { return nil }
            return leaderboard
        }.first { $0.id == gameCenterLeaderboardVersionV2.relationships?.leaderboard?.data?.id }
    }

    public func getLocalizations(for gameCenterLeaderboardVersionV2: GameCenterLeaderboardVersionV2) -> [GameCenterLeaderboardLocalizationV2] {
        guard let localizationIds = gameCenterLeaderboardVersionV2.relationships?.localizations?.data?.map(\.id),
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
