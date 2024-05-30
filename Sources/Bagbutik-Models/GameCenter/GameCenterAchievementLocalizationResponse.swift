import Bagbutik_Core
import Foundation

public struct GameCenterAchievementLocalizationResponse: Codable {
    public let data: GameCenterAchievementLocalization
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterAchievementLocalization,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(GameCenterAchievementLocalization.self, forKey: .data)
        included = try container.decodeIfPresent([Included].self, forKey: .included)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
    }

    public func getGameCenterAchievement() -> GameCenterAchievement? {
        included?.compactMap { relationship -> GameCenterAchievement? in
            guard case let .gameCenterAchievement(gameCenterAchievement) = relationship else { return nil }
            return gameCenterAchievement
        }.first { $0.id == data.relationships?.gameCenterAchievement?.data?.id }
    }

    public func getGameCenterAchievementImage() -> GameCenterAchievementImage? {
        included?.compactMap { relationship -> GameCenterAchievementImage? in
            guard case let .gameCenterAchievementImage(gameCenterAchievementImage) = relationship else { return nil }
            return gameCenterAchievementImage
        }.first { $0.id == data.relationships?.gameCenterAchievementImage?.data?.id }
    }

    public enum Included: Codable {
        case gameCenterAchievement(GameCenterAchievement)
        case gameCenterAchievementImage(GameCenterAchievementImage)

        public init(from decoder: Decoder) throws {
            if let gameCenterAchievement = try? GameCenterAchievement(from: decoder) {
                self = .gameCenterAchievement(gameCenterAchievement)
            } else if let gameCenterAchievementImage = try? GameCenterAchievementImage(from: decoder) {
                self = .gameCenterAchievementImage(gameCenterAchievementImage)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterAchievement(value):
                try value.encode(to: encoder)
            case let .gameCenterAchievementImage(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
