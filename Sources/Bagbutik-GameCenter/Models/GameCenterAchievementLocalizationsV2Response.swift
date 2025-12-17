import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterAchievementLocalizationsV2Response
 A response that contains a single Game Center achievement localization v2 resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterachievementlocalizationsv2response>
 */
public struct GameCenterAchievementLocalizationsV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterAchievementLocalizationV2

    public let data: [GameCenterAchievementLocalizationV2]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterAchievementLocalizationV2],
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
        data = try container.decode([GameCenterAchievementLocalizationV2].self, forKey: "data")
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

    public func getImage(for gameCenterAchievementLocalizationV2: GameCenterAchievementLocalizationV2) -> GameCenterAchievementImageV2? {
        included?.compactMap { relationship -> GameCenterAchievementImageV2? in
            guard case let .gameCenterAchievementImageV2(image) = relationship else { return nil }
            return image
        }.first { $0.id == gameCenterAchievementLocalizationV2.relationships?.image?.data?.id }
    }

    public func getVersion(for gameCenterAchievementLocalizationV2: GameCenterAchievementLocalizationV2) -> GameCenterAchievementVersionV2? {
        included?.compactMap { relationship -> GameCenterAchievementVersionV2? in
            guard case let .gameCenterAchievementVersionV2(version) = relationship else { return nil }
            return version
        }.first { $0.id == gameCenterAchievementLocalizationV2.relationships?.version?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case gameCenterAchievementImageV2(GameCenterAchievementImageV2)
        case gameCenterAchievementVersionV2(GameCenterAchievementVersionV2)

        public init(from decoder: Decoder) throws {
            if let gameCenterAchievementImageV2 = try? GameCenterAchievementImageV2(from: decoder) {
                self = .gameCenterAchievementImageV2(gameCenterAchievementImageV2)
            } else if let gameCenterAchievementVersionV2 = try? GameCenterAchievementVersionV2(from: decoder) {
                self = .gameCenterAchievementVersionV2(gameCenterAchievementVersionV2)
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
            case let .gameCenterAchievementImageV2(value):
                try value.encode(to: encoder)
            case let .gameCenterAchievementVersionV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
