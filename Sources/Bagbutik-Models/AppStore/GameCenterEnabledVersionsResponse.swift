import Bagbutik_Core
import Foundation

/**
 # GameCenterEnabledVersionsResponse
 A response that contains a list of Game Center Enabled Version resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversionsresponse>
 */
public struct GameCenterEnabledVersionsResponse: Codable, PagedResponse {
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

    public enum Included: Codable {
        case app(App)
        case gameCenterEnabledVersion(GameCenterEnabledVersion)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let gameCenterEnabledVersion = try? GameCenterEnabledVersion(from: decoder) {
                self = .gameCenterEnabledVersion(gameCenterEnabledVersion)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
