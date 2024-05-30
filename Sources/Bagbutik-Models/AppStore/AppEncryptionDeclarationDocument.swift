import Bagbutik_Core
import Foundation

public struct AppEncryptionDeclarationDocument: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appEncryptionDeclarationDocuments" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    public struct Attributes: Codable {
        public var assetDeliveryState: AppMediaAssetState?
        public var assetToken: String?
        public var downloadUrl: String?
        public var fileName: String?
        public var fileSize: Int?
        public var sourceFileChecksum: String?
        public var uploadOperations: [UploadOperation]?

        public init(assetDeliveryState: AppMediaAssetState? = nil,
                    assetToken: String? = nil,
                    downloadUrl: String? = nil,
                    fileName: String? = nil,
                    fileSize: Int? = nil,
                    sourceFileChecksum: String? = nil,
                    uploadOperations: [UploadOperation]? = nil)
        {
            self.assetDeliveryState = assetDeliveryState
            self.assetToken = assetToken
            self.downloadUrl = downloadUrl
            self.fileName = fileName
            self.fileSize = fileSize
            self.sourceFileChecksum = sourceFileChecksum
            self.uploadOperations = uploadOperations
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            assetDeliveryState = try container.decodeIfPresent(AppMediaAssetState.self, forKey: .assetDeliveryState)
            assetToken = try container.decodeIfPresent(String.self, forKey: .assetToken)
            downloadUrl = try container.decodeIfPresent(String.self, forKey: .downloadUrl)
            fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
            fileSize = try container.decodeIfPresent(Int.self, forKey: .fileSize)
            sourceFileChecksum = try container.decodeIfPresent(String.self, forKey: .sourceFileChecksum)
            uploadOperations = try container.decodeIfPresent([UploadOperation].self, forKey: .uploadOperations)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(assetDeliveryState, forKey: .assetDeliveryState)
            try container.encodeIfPresent(assetToken, forKey: .assetToken)
            try container.encodeIfPresent(downloadUrl, forKey: .downloadUrl)
            try container.encodeIfPresent(fileName, forKey: .fileName)
            try container.encodeIfPresent(fileSize, forKey: .fileSize)
            try container.encodeIfPresent(sourceFileChecksum, forKey: .sourceFileChecksum)
            try container.encodeIfPresent(uploadOperations, forKey: .uploadOperations)
        }

        private enum CodingKeys: String, CodingKey {
            case assetDeliveryState
            case assetToken
            case downloadUrl
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations
        }
    }
}
