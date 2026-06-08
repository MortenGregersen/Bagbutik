import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # GameCenterAppVersionResponse
 A response that contains a single app version resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterappversionresponse>
 */
public struct GameCenterAppVersionResponse: Codable, Sendable {
    public let data: GameCenterAppVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: GameCenterAppVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(GameCenterAppVersion.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppStoreVersion() -> AppStoreVersion? {
        included?.compactMap { relationship -> AppStoreVersion? in
            guard case let .appStoreVersion(appStoreVersion) = relationship else { return nil }
            return appStoreVersion
        }.first { $0.id == data.relationships?.appStoreVersion?.data?.id }
    }

    public func getCompatibilityVersions() -> [GameCenterAppVersion] {
        guard let compatibilityVersionIds = data.relationships?.compatibilityVersions?.data?.map(\.id),
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
