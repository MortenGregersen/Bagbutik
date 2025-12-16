import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterLeaderboardLocalizationV2Response
 A response that contains a single Game Center leaderboard localization v2 resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardlocalizationv2response>
 */
public struct GameCenterLeaderboardLocalizationV2Response: Codable, Sendable {
    public let data: GameCenterLeaderboardLocalizationV2
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterLeaderboardLocalizationV2,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterLeaderboardLocalizationV2.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getImage() -> GameCenterLeaderboardImageV2? {
        included?.compactMap { relationship -> GameCenterLeaderboardImageV2? in
            guard case let .gameCenterLeaderboardImageV2(image) = relationship else { return nil }
            return image
        }.first { $0.id == data.relationships?.image?.data?.id }
    }

    public func getVersion() -> GameCenterLeaderboardVersionV2? {
        included?.compactMap { relationship -> GameCenterLeaderboardVersionV2? in
            guard case let .gameCenterLeaderboardVersionV2(version) = relationship else { return nil }
            return version
        }.first { $0.id == data.relationships?.version?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case gameCenterLeaderboardImageV2(GameCenterLeaderboardImageV2)
        case gameCenterLeaderboardVersionV2(GameCenterLeaderboardVersionV2)

        public init(from decoder: Decoder) throws {
            if let gameCenterLeaderboardImageV2 = try? GameCenterLeaderboardImageV2(from: decoder) {
                self = .gameCenterLeaderboardImageV2(gameCenterLeaderboardImageV2)
            } else if let gameCenterLeaderboardVersionV2 = try? GameCenterLeaderboardVersionV2(from: decoder) {
                self = .gameCenterLeaderboardVersionV2(gameCenterLeaderboardVersionV2)
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
            case let .gameCenterLeaderboardImageV2(value):
                try value.encode(to: encoder)
            case let .gameCenterLeaderboardVersionV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
