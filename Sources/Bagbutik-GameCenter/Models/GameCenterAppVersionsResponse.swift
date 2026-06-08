import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterAppVersionsResponse
 A response that contains a list of app version resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterappversionsresponse>
 */
public struct GameCenterAppVersionsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = GameCenterAppVersion

    public let data: [GameCenterAppVersion]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [GameCenterAppVersion],
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
        data = try container.decode([GameCenterAppVersion].self, forKey: "data")
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

    public func getAppStoreVersion(for gameCenterAppVersion: GameCenterAppVersion) -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(appStoreVersion) = relationship else { return nil }
            return appStoreVersion
        }.first { $0.id == gameCenterAppVersion.relationships?.appStoreVersion?.data?.id }
    }

    public func getCompatibilityVersions(for gameCenterAppVersion: GameCenterAppVersion) -> [GameCenterAppVersion] {
        guard let compatibilityVersionIds = gameCenterAppVersion.relationships?.compatibilityVersions?.data?.map(\.id),
              let compatibilityVersions = included?.compactMap({ relationship -> GameCenterAppVersion? in
                  guard case let .gameCenterAppVersion(compatibilityVersion) = relationship else { return nil }
                  return compatibilityVersionIds.contains(compatibilityVersion.id) ? compatibilityVersion : nil
              })
        else {
            return []
        }
        return compatibilityVersions
    }

    public enum Included: Codable, Sendable {
        case appStoreVersion(AppStoreVersion)
        case gameCenterAppVersion(GameCenterAppVersion)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "appStoreVersions":
                self = .appStoreVersion(try AppStoreVersion(from: decoder))
            case "gameCenterAppVersions":
                self = .gameCenterAppVersion(try GameCenterAppVersion(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appStoreVersion(value):
                try value.encode(to: encoder)
            case let .gameCenterAppVersion(value):
                try value.encode(to: encoder)
            }
        }
    }
}
