import Bagbutik_Core
import Foundation

/**
 # GameCenterAppVersionsResponse
 A response that contains a list of app version resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterappversionsresponse>
 */
public struct GameCenterAppVersionsResponse: Codable, PagedResponse {
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
