import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterActivityLocalizationsResponse
 A response containing a list of localizations for a Game Center activity.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenteractivitylocalizationsresponse>
 */
public struct GameCenterActivityLocalizationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterActivityLocalization

    public let data: [GameCenterActivityLocalization]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterActivityLocalization],
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
        data = try container.decode([GameCenterActivityLocalization].self, forKey: "data")
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

    public func getImage(for gameCenterActivityLocalization: GameCenterActivityLocalization) -> GameCenterActivityImage? {
        included?.compactMap { relationship -> GameCenterActivityImage? in
            guard case let .gameCenterActivityImage(image) = relationship else { return nil }
            return image
        }.first { $0.id == gameCenterActivityLocalization.relationships?.image?.data?.id }
    }

    public func getVersion(for gameCenterActivityLocalization: GameCenterActivityLocalization) -> GameCenterActivityVersion? {
        included?.compactMap { relationship -> GameCenterActivityVersion? in
            guard case let .gameCenterActivityVersion(version) = relationship else { return nil }
            return version
        }.first { $0.id == gameCenterActivityLocalization.relationships?.version?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case gameCenterActivityImage(GameCenterActivityImage)
        case gameCenterActivityVersion(GameCenterActivityVersion)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "gameCenterActivityImages":
                self = .gameCenterActivityImage(try GameCenterActivityImage(from: decoder))
            case "gameCenterActivityVersions":
                self = .gameCenterActivityVersion(try GameCenterActivityVersion(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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
