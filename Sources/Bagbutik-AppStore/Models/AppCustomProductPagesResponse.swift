import Bagbutik_Core
import Foundation

public struct AppCustomProductPagesResponse: Codable, PagedResponse {
    public typealias Data = AppCustomProductPage

    public let data: [AppCustomProductPage]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppCustomProductPage],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getApp(for appCustomProductPage: AppCustomProductPage) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == appCustomProductPage.relationships?.app?.data?.id }
    }

    public func getAppCustomProductPageVersions(for appCustomProductPage: AppCustomProductPage) -> [AppCustomProductPageVersion] {
        guard let appCustomProductPageVersionIds = appCustomProductPage.relationships?.appCustomProductPageVersions?.data?.map(\.id),
              let appCustomProductPageVersions = included?.compactMap({ relationship -> AppCustomProductPageVersion? in
                  guard case let .appCustomProductPageVersion(appCustomProductPageVersion) = relationship else { return nil }
                  return appCustomProductPageVersionIds.contains(appCustomProductPageVersion.id) ? appCustomProductPageVersion : nil
              })
        else {
            return []
        }
        return appCustomProductPageVersions
    }

    public enum Included: Codable {
        case app(App)
        case appCustomProductPageVersion(AppCustomProductPageVersion)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appCustomProductPageVersion = try? AppCustomProductPageVersion(from: decoder) {
                self = .appCustomProductPageVersion(appCustomProductPageVersion)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .appCustomProductPageVersion(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
