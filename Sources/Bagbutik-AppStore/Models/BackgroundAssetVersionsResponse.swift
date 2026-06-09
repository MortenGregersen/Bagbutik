import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetVersionsResponse
 A response containing a list of versions for a background asset.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetversionsresponse>
 */
public struct BackgroundAssetVersionsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BackgroundAssetVersion

    public let data: [BackgroundAssetVersion]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BackgroundAssetVersion],
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
        data = try container.decode([BackgroundAssetVersion].self, forKey: "data")
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

    public func getAppStoreRelease(for backgroundAssetVersion: BackgroundAssetVersion) -> BackgroundAssetVersionAppStoreRelease? {
        included?.compactMap { relationship -> BackgroundAssetVersionAppStoreRelease? in
            guard case let .backgroundAssetVersionAppStoreRelease(appStoreRelease) = relationship else { return nil }
            return appStoreRelease
        }.first { $0.id == backgroundAssetVersion.relationships?.appStoreRelease?.data?.id }
    }

    public func getAssetFile(for backgroundAssetVersion: BackgroundAssetVersion) -> BackgroundAssetUploadFile? {
        included?.compactMap { relationship -> BackgroundAssetUploadFile? in
            guard case let .backgroundAssetUploadFile(assetFile) = relationship else { return nil }
            return assetFile
        }.first { $0.id == backgroundAssetVersion.relationships?.assetFile?.data?.id }
    }

    public func getBackgroundAsset(for backgroundAssetVersion: BackgroundAssetVersion) -> BackgroundAsset? {
        included?.compactMap { relationship -> BackgroundAsset? in
            guard case let .backgroundAsset(backgroundAsset) = relationship else { return nil }
            return backgroundAsset
        }.first { $0.id == backgroundAssetVersion.relationships?.backgroundAsset?.data?.id }
    }

    public func getExternalBetaRelease(for backgroundAssetVersion: BackgroundAssetVersion) -> BackgroundAssetVersionExternalBetaRelease? {
        included?.compactMap { relationship -> BackgroundAssetVersionExternalBetaRelease? in
            guard case let .backgroundAssetVersionExternalBetaRelease(externalBetaRelease) = relationship else { return nil }
            return externalBetaRelease
        }.first { $0.id == backgroundAssetVersion.relationships?.externalBetaRelease?.data?.id }
    }

    public func getInternalBetaRelease(for backgroundAssetVersion: BackgroundAssetVersion) -> BackgroundAssetVersionInternalBetaRelease? {
        included?.compactMap { relationship -> BackgroundAssetVersionInternalBetaRelease? in
            guard case let .backgroundAssetVersionInternalBetaRelease(internalBetaRelease) = relationship else { return nil }
            return internalBetaRelease
        }.first { $0.id == backgroundAssetVersion.relationships?.internalBetaRelease?.data?.id }
    }

    public func getManifestFile(for backgroundAssetVersion: BackgroundAssetVersion) -> BackgroundAssetUploadFile? {
        included?.compactMap { relationship -> BackgroundAssetUploadFile? in
            guard case let .backgroundAssetUploadFile(manifestFile) = relationship else { return nil }
            return manifestFile
        }.first { $0.id == backgroundAssetVersion.relationships?.manifestFile?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case backgroundAsset(BackgroundAsset)
        case backgroundAssetUploadFile(BackgroundAssetUploadFile)
        case backgroundAssetVersionAppStoreRelease(BackgroundAssetVersionAppStoreRelease)
        case backgroundAssetVersionExternalBetaRelease(BackgroundAssetVersionExternalBetaRelease)
        case backgroundAssetVersionInternalBetaRelease(BackgroundAssetVersionInternalBetaRelease)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "backgroundAssets":
                self = .backgroundAsset(try BackgroundAsset(from: decoder))
            case "backgroundAssetUploadFiles":
                self = .backgroundAssetUploadFile(try BackgroundAssetUploadFile(from: decoder))
            case "backgroundAssetVersionAppStoreReleases":
                self = .backgroundAssetVersionAppStoreRelease(try BackgroundAssetVersionAppStoreRelease(from: decoder))
            case "backgroundAssetVersionExternalBetaReleases":
                self = .backgroundAssetVersionExternalBetaRelease(try BackgroundAssetVersionExternalBetaRelease(from: decoder))
            case "backgroundAssetVersionInternalBetaReleases":
                self = .backgroundAssetVersionInternalBetaRelease(try BackgroundAssetVersionInternalBetaRelease(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .backgroundAsset(value):
                try value.encode(to: encoder)
            case let .backgroundAssetUploadFile(value):
                try value.encode(to: encoder)
            case let .backgroundAssetVersionAppStoreRelease(value):
                try value.encode(to: encoder)
            case let .backgroundAssetVersionExternalBetaRelease(value):
                try value.encode(to: encoder)
            case let .backgroundAssetVersionInternalBetaRelease(value):
                try value.encode(to: encoder)
            }
        }
    }
}
