import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BuildUploadResponse
 A response that contains a single build upload resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/builduploadresponse>
 */
public struct BuildUploadResponse: Codable, Sendable {
    public let data: BuildUpload
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: BuildUpload,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BuildUpload.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAssetDescriptionFile() -> BuildUploadFile? {
        included?.compactMap { relationship -> BuildUploadFile? in
            guard case let .buildUploadFile(assetDescriptionFile) = relationship else { return nil }
            return assetDescriptionFile
        }.first { $0.id == data.relationships?.assetDescriptionFile?.data?.id }
    }

    public func getAssetFile() -> BuildUploadFile? {
        included?.compactMap { relationship -> BuildUploadFile? in
            guard case let .buildUploadFile(assetFile) = relationship else { return nil }
            return assetFile
        }.first { $0.id == data.relationships?.assetFile?.data?.id }
    }

    public func getAssetSpiFile() -> BuildUploadFile? {
        included?.compactMap { relationship -> BuildUploadFile? in
            guard case let .buildUploadFile(assetSpiFile) = relationship else { return nil }
            return assetSpiFile
        }.first { $0.id == data.relationships?.assetSpiFile?.data?.id }
    }

    public func getBuild() -> Build? {
        included?.compactMap { relationship -> Build? in
            guard case let .build(build) = relationship else { return nil }
            return build
        }.first { $0.id == data.relationships?.build?.data?.id }
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
