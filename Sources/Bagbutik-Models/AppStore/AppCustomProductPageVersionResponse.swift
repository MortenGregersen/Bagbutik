import Bagbutik_Core
import Foundation

public struct AppCustomProductPageVersionResponse: Codable {
    public let data: AppCustomProductPageVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppCustomProductPageVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppCustomProductPageVersion.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppCustomProductPage() -> AppCustomProductPage? {
        included?.compactMap { relationship -> AppCustomProductPage? in
            guard case let .appCustomProductPage(appCustomProductPage) = relationship else { return nil }
            return appCustomProductPage
        }.first { $0.id == data.relationships?.appCustomProductPage?.data?.id }
    }

    public func getAppCustomProductPageLocalizations() -> [AppCustomProductPageLocalization] {
        guard let appCustomProductPageLocalizationIds = data.relationships?.appCustomProductPageLocalizations?.data?.map(\.id),
              let appCustomProductPageLocalizations = included?.compactMap({ relationship -> AppCustomProductPageLocalization? in
                  guard case let .appCustomProductPageLocalization(appCustomProductPageLocalization) = relationship else { return nil }
                  return appCustomProductPageLocalizationIds.contains(appCustomProductPageLocalization.id) ? appCustomProductPageLocalization : nil
              })
        else {
            return []
        }
        return appCustomProductPageLocalizations
    }

    public enum Included: Codable {
        case appCustomProductPage(AppCustomProductPage)
        case appCustomProductPageLocalization(AppCustomProductPageLocalization)

        public init(from decoder: Decoder) throws {
            if let appCustomProductPage = try? AppCustomProductPage(from: decoder) {
                self = .appCustomProductPage(appCustomProductPage)
            } else if let appCustomProductPageLocalization = try? AppCustomProductPageLocalization(from: decoder) {
                self = .appCustomProductPageLocalization(appCustomProductPageLocalization)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appCustomProductPage(value):
                try value.encode(to: encoder)
            case let .appCustomProductPageLocalization(value):
                try value.encode(to: encoder)
            }
        }
    }
}
