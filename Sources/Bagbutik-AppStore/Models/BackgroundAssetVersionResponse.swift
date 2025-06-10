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

    public func getAssetFile() -> BackgroundAssetUploadFile? {
        included?.compactMap { relationship -> BackgroundAssetUploadFile? in
            guard case let .backgroundAssetUploadFile(assetFile) = relationship else { return nil }
            return assetFile
        }.first { $0.id == data.relationships?.assetFile?.data?.id }
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
        case backgroundAssetUploadFile(BackgroundAssetUploadFile)
        case backgroundAssetVersionInternalBetaRelease(BackgroundAssetVersionInternalBetaRelease)

        public init(from decoder: Decoder) throws {
            if let backgroundAssetUploadFile = try? BackgroundAssetUploadFile(from: decoder) {
                self = .backgroundAssetUploadFile(backgroundAssetUploadFile)
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
            case let .backgroundAssetUploadFile(value):
                try value.encode(to: encoder)
            case let .backgroundAssetVersionInternalBetaRelease(value):
                try value.encode(to: encoder)
            }
        }
    }
}
