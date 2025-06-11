import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivityLocalizationResponse
 A response that contains a single activity localization resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivitylocalizationresponse>
 */
public struct GameCenterActivityLocalizationResponse: Codable, Sendable {
    public let data: GameCenterActivityLocalization
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterActivityLocalization,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterActivityLocalization.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getImage() -> GameCenterActivityImage? {
        included?.compactMap { relationship -> GameCenterActivityImage? in
            guard case let .gameCenterActivityImage(image) = relationship else { return nil }
            return image
        }.first { $0.id == data.relationships?.image?.data?.id }
    }

    public func getVersion() -> GameCenterActivityVersion? {
        included?.compactMap { relationship -> GameCenterActivityVersion? in
            guard case let .gameCenterActivityVersion(version) = relationship else { return nil }
            return version
        }.first { $0.id == data.relationships?.version?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case gameCenterActivityImage(GameCenterActivityImage)
        case gameCenterActivityVersion(GameCenterActivityVersion)

        public init(from decoder: Decoder) throws {
            if let gameCenterActivityImage = try? GameCenterActivityImage(from: decoder) {
                self = .gameCenterActivityImage(gameCenterActivityImage)
            } else if let gameCenterActivityVersion = try? GameCenterActivityVersion(from: decoder) {
                self = .gameCenterActivityVersion(gameCenterActivityVersion)
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
            case let .gameCenterActivityImage(value):
                try value.encode(to: encoder)
            case let .gameCenterActivityVersion(value):
                try value.encode(to: encoder)
            }
        }
    }
}
