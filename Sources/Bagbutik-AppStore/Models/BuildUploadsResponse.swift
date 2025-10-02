import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BuildUploadsResponse
 A response that contains a list of build upload resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/builduploadsresponse>
 */
public struct BuildUploadsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BuildUpload

    public let data: [BuildUpload]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BuildUpload],
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
        data = try container.decode([BuildUpload].self, forKey: "data")
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

    public func getAssetDescriptionFile(for buildUpload: BuildUpload) -> BuildUploadFile? {
        included?.compactMap { relationship -> BuildUploadFile? in
            guard case let .buildUploadFile(assetDescriptionFile) = relationship else { return nil }
            return assetDescriptionFile
        }.first { $0.id == buildUpload.relationships?.assetDescriptionFile?.data?.id }
    }

    public func getAssetFile(for buildUpload: BuildUpload) -> BuildUploadFile? {
        included?.compactMap { relationship -> BuildUploadFile? in
            guard case let .buildUploadFile(assetFile) = relationship else { return nil }
            return assetFile
        }.first { $0.id == buildUpload.relationships?.assetFile?.data?.id }
    }

    public func getAssetSpiFile(for buildUpload: BuildUpload) -> BuildUploadFile? {
        included?.compactMap { relationship -> BuildUploadFile? in
            guard case let .buildUploadFile(assetSpiFile) = relationship else { return nil }
            return assetSpiFile
        }.first { $0.id == buildUpload.relationships?.assetSpiFile?.data?.id }
    }

    public func getBuild(for buildUpload: BuildUpload) -> Build? {
        included?.compactMap { relationship -> Build? in
            guard case let .build(build) = relationship else { return nil }
            return build
        }.first { $0.id == buildUpload.relationships?.build?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case build(Build)
        case buildUploadFile(BuildUploadFile)

        public init(from decoder: Decoder) throws {
            if let build = try? Build(from: decoder) {
                self = .build(build)
            } else if let buildUploadFile = try? BuildUploadFile(from: decoder) {
                self = .buildUploadFile(buildUploadFile)
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
            case let .build(value):
                try value.encode(to: encoder)
            case let .buildUploadFile(value):
                try value.encode(to: encoder)
            }
        }
    }
}
