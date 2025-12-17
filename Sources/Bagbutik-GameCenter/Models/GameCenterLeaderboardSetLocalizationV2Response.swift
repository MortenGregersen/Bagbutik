import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardSetLocalizationV2Response
 A response that contains a single Game Center leaderboard set localization v2 resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardsetlocalizationv2response>
 */
public struct GameCenterLeaderboardSetLocalizationV2Response: Codable, Sendable {
    public let data: GameCenterLeaderboardSetLocalizationV2
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardSetLocalizationV2,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterLeaderboardSetLocalizationV2.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getImage() -> GameCenterLeaderboardSetImageV2? {
        included?.compactMap { relationship -> GameCenterLeaderboardSetImageV2? in
            guard case let .gameCenterLeaderboardSetImageV2(image) = relationship else { return nil }
            return image
        }.first { $0.id == data.relationships?.image?.data?.id }
    }

    public func getVersion() -> GameCenterLeaderboardSetVersionV2? {
        included?.compactMap { relationship -> GameCenterLeaderboardSetVersionV2? in
            guard case let .gameCenterLeaderboardSetVersionV2(version) = relationship else { return nil }
            return version
        }.first { $0.id == data.relationships?.version?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case gameCenterLeaderboardSetImageV2(GameCenterLeaderboardSetImageV2)
        case gameCenterLeaderboardSetVersionV2(GameCenterLeaderboardSetVersionV2)

        public init(from decoder: Decoder) throws {
            if let gameCenterLeaderboardSetImageV2 = try? GameCenterLeaderboardSetImageV2(from: decoder) {
                self = .gameCenterLeaderboardSetImageV2(gameCenterLeaderboardSetImageV2)
            } else if let gameCenterLeaderboardSetVersionV2 = try? GameCenterLeaderboardSetVersionV2(from: decoder) {
                self = .gameCenterLeaderboardSetVersionV2(gameCenterLeaderboardSetVersionV2)
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
            case let .gameCenterLeaderboardSetImageV2(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardSetVersionV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
