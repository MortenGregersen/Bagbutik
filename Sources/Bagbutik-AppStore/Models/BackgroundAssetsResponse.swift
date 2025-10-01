import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetsResponse
 A response that contains a list of background asset version resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetsresponse>
 */
public struct BackgroundAssetsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BackgroundAsset

    public let data: [BackgroundAsset]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BackgroundAsset],
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
        data = try container.decode([BackgroundAsset].self, forKey: "data")
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

    public func getApp(for backgroundAsset: BackgroundAsset) -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == backgroundAsset.relationships?.app?.data?.id }
    }

    public func getAppStoreVersion(for backgroundAsset: BackgroundAsset) -> BackgroundAssetVersion? {
        included?.compactMap { relationship -> BackgroundAssetVersion? in
            guard case let .backgroundAssetVersion(appStoreVersion) = relationship else { return nil }
            return appStoreVersion
        }.first { $0.id == backgroundAsset.relationships?.appStoreVersion?.data?.id }
    }

    public func getExternalBetaVersion(for backgroundAsset: BackgroundAsset) -> BackgroundAssetVersion? {
        included?.compactMap { relationship -> BackgroundAssetVersion? in
            guard case let .backgroundAssetVersion(externalBetaVersion) = relationship else { return nil }
            return externalBetaVersion
        }.first { $0.id == backgroundAsset.relationships?.externalBetaVersion?.data?.id }
    }

    public func getInternalBetaVersion(for backgroundAsset: BackgroundAsset) -> BackgroundAssetVersion? {
        included?.compactMap { relationship -> BackgroundAssetVersion? in
            guard case let .backgroundAssetVersion(internalBetaVersion) = relationship else { return nil }
            return internalBetaVersion
        }.first { $0.id == backgroundAsset.relationships?.internalBetaVersion?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case app(App)
        case backgroundAssetVersion(BackgroundAssetVersion)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let backgroundAssetVersion = try? BackgroundAssetVersion(from: decoder) {
                self = .backgroundAssetVersion(backgroundAssetVersion)
            } else {
                throw DecodingError.typeMismatch(
                    Included.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .backgroundAssetVersion(value):
                try value.encode(to: encoder)
            }
        }
    }
}
