import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetVersionResponse
 A response that contains a single background asset version resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetversionresponse>
 */
public struct BackgroundAssetVersionResponse: Codable, Sendable {
    public let data: BackgroundAssetVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: BackgroundAssetVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BackgroundAssetVersion.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppStoreRelease() -> BackgroundAssetVersionAppStoreRelease? {
        included?.compactMap { relationship -> BackgroundAssetVersionAppStoreRelease? in
            guard case let .backgroundAssetVersionAppStoreRelease(appStoreRelease) = relationship else { return nil }
            return appStoreRelease
        }.first { $0.id == data.relationships?.appStoreRelease?.data?.id }
    }

    public func getAssetFile() -> BackgroundAssetUploadFile? {
        included?.compactMap { relationship -> BackgroundAssetUploadFile? in
            guard case let .backgroundAssetUploadFile(assetFile) = relationship else { return nil }
            return assetFile
        }.first { $0.id == data.relationships?.assetFile?.data?.id }
    }

    public func getBackgroundAsset() -> BackgroundAsset? {
        included?.compactMap { relationship -> BackgroundAsset? in
            guard case let .backgroundAsset(backgroundAsset) = relationship else { return nil }
            return backgroundAsset
        }.first { $0.id == data.relationships?.backgroundAsset?.data?.id }
    }

    public func getExternalBetaRelease() -> BackgroundAssetVersionExternalBetaRelease? {
        included?.compactMap { relationship -> BackgroundAssetVersionExternalBetaRelease? in
            guard case let .backgroundAssetVersionExternalBetaRelease(externalBetaRelease) = relationship else { return nil }
            return externalBetaRelease
        }.first { $0.id == data.relationships?.externalBetaRelease?.data?.id }
    }

    public func getInternalBetaRelease() -> BackgroundAssetVersionInternalBetaRelease? {
        included?.compactMap { relationship -> BackgroundAssetVersionInternalBetaRelease? in
            guard case let .backgroundAssetVersionInternalBetaRelease(internalBetaRelease) = relationship else { return nil }
            return internalBetaRelease
        }.first { $0.id == data.relationships?.internalBetaRelease?.data?.id }
    }

    public func getManifestFile() -> BackgroundAssetUploadFile? {
        included?.compactMap { relationship -> BackgroundAssetUploadFile? in
            guard case let .backgroundAssetUploadFile(manifestFile) = relationship else { return nil }
            return manifestFile
        }.first { $0.id == data.relationships?.manifestFile?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case backgroundAsset(BackgroundAsset)
        case backgroundAssetUploadFile(BackgroundAssetUploadFile)
        case backgroundAssetVersionAppStoreRelease(BackgroundAssetVersionAppStoreRelease)
        case backgroundAssetVersionExternalBetaRelease(BackgroundAssetVersionExternalBetaRelease)
        case backgroundAssetVersionInternalBetaRelease(BackgroundAssetVersionInternalBetaRelease)

        public init(from decoder: Decoder) throws {
            if let backgroundAsset = try? BackgroundAsset(from: decoder) {
                self = .backgroundAsset(backgroundAsset)
            } else if let backgroundAssetUploadFile = try? BackgroundAssetUploadFile(from: decoder) {
                self = .backgroundAssetUploadFile(backgroundAssetUploadFile)
            } else if let backgroundAssetVersionAppStoreRelease = try? BackgroundAssetVersionAppStoreRelease(from: decoder) {
                self = .backgroundAssetVersionAppStoreRelease(backgroundAssetVersionAppStoreRelease)
            } else if let backgroundAssetVersionExternalBetaRelease = try? BackgroundAssetVersionExternalBetaRelease(from: decoder) {
                self = .backgroundAssetVersionExternalBetaRelease(backgroundAssetVersionExternalBetaRelease)
            } else if let backgroundAssetVersionInternalBetaRelease = try? BackgroundAssetVersionInternalBetaRelease(from: decoder) {
                self = .backgroundAssetVersionInternalBetaRelease(backgroundAssetVersionInternalBetaRelease)
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
