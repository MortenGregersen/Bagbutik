import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetResponse
 A response that contains a single background asset version resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetresponse>
 */
public struct BackgroundAssetResponse: Codable, Sendable {
    public let data: BackgroundAsset
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: BackgroundAsset,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BackgroundAsset.self, forKey: "data")
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

    public func getAppStoreVersion() -> BackgroundAssetVersion? {
        included?.compactMap { relationship -> BackgroundAssetVersion? in
            guard case let .backgroundAssetVersion(appStoreVersion) = relationship else { return nil }
            return appStoreVersion
        }.first { $0.id == data.relationships?.appStoreVersion?.data?.id }
    }

    public func getExternalBetaVersion() -> BackgroundAssetVersion? {
        included?.compactMap { relationship -> BackgroundAssetVersion? in
            guard case let .backgroundAssetVersion(externalBetaVersion) = relationship else { return nil }
            return externalBetaVersion
        }.first { $0.id == data.relationships?.externalBetaVersion?.data?.id }
    }

    public func getInternalBetaVersion() -> BackgroundAssetVersion? {
        included?.compactMap { relationship -> BackgroundAssetVersion? in
            guard case let .backgroundAssetVersion(internalBetaVersion) = relationship else { return nil }
            return internalBetaVersion
        }.first { $0.id == data.relationships?.internalBetaVersion?.data?.id }
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
