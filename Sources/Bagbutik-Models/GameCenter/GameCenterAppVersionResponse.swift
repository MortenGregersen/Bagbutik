import Bagbutik_Core
import Foundation

/**
 # GameCenterAppVersionResponse
 A response that contains a single app version resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterappversionresponse>
 */
public struct GameCenterAppVersionResponse: Codable {
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

    public enum Included: Codable {
        case appStoreVersion(AppStoreVersion)
        case gameCenterAppVersion(GameCenterAppVersion)

        public init(from decoder: Decoder) throws {
            if let appStoreVersion = try? AppStoreVersion(from: decoder) {
                self = .appStoreVersion(appStoreVersion)
            } else if let gameCenterAppVersion = try? GameCenterAppVersion(from: decoder) {
                self = .gameCenterAppVersion(gameCenterAppVersion)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
