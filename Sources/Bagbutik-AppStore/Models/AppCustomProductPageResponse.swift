import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppCustomProductPageResponse
 A response that contains a single app custom product page resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appcustomproductpageresponse>
 */
public struct AppCustomProductPageResponse: Codable, Sendable {
    public let data: AppCustomProductPage
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppCustomProductPage,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppCustomProductPage.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getAppCustomProductPageVersions() -> [AppCustomProductPageVersion] {
        guard let appCustomProductPageVersionIds = data.relationships?.appCustomProductPageVersions?.data?.map(\.id),
              let appCustomProductPageVersions = included?.compactMap({ relationship -> AppCustomProductPageVersion? in
                  guard case let .appCustomProductPageVersion(appCustomProductPageVersion) = relationship else { return nil }
                  return appCustomProductPageVersionIds.contains(appCustomProductPageVersion.id) ? appCustomProductPageVersion : nil
              })
        else {
            return []
        }
        return appCustomProductPageVersions
    }

    public enum Included: Codable, Sendable {
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
    }
}
