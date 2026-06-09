import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterEnabledVersionsResponse
 A response containing a list of app versions with Game Center enabled (deprecated; use GameCenterAppVersion).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversionsresponse>
 */
public struct GameCenterEnabledVersionsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterEnabledVersion

    public let data: [GameCenterEnabledVersion]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterEnabledVersion],
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
        data = try container.decode([GameCenterEnabledVersion].self, forKey: "data")
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

    public func getApp(for gameCenterEnabledVersion: GameCenterEnabledVersion) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == gameCenterEnabledVersion.relationships?.app?.data?.id }
    }

    public func getCompatibleVersions(for gameCenterEnabledVersion: GameCenterEnabledVersion) -> [GameCenterEnabledVersion] {
        guard let compatibleVersionIds = gameCenterEnabledVersion.relationships?.compatibleVersions?.data?.map(\.id),
              let compatibleVersions = included?.compactMap({ relationship -> GameCenterEnabledVersion? in
                  guard case let .gameCenterEnabledVersion(compatibleVersion) = relationship else { return nil }
                  return compatibleVersionIds.contains(compatibleVersion.id) ? compatibleVersion : nil
              })
        else {
            return []
        }
        return compatibleVersions
    }

    public enum Included: Codable, Sendable {
        case app(App)
        case gameCenterEnabledVersion(GameCenterEnabledVersion)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "apps":
                self = .app(try App(from: decoder))
            case "gameCenterEnabledVersions":
                self = .gameCenterEnabledVersion(try GameCenterEnabledVersion(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .gameCenterEnabledVersion(value):
                try value.encode(to: encoder)
            }
        }
    }
}
