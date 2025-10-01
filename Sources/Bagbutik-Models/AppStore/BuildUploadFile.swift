import Bagbutik_Core
import Foundation

/**
 # BuildUploadFile
 The data structure that represents a build upload resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/builduploadfile>
 */
public struct BuildUploadFile: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "buildUploadFiles" }
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
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
        public var assetDeliveryState: AppMediaAssetState?
        public var assetToken: String?
        public var assetType: AssetType?
        public var fileName: String?
        public var fileSize: Int?
        public var sourceFileChecksums: Checksums?
        public var uploadOperations: [DeliveryFileUploadOperation]?
        public var uti: Uti?

        public init(assetDeliveryState: AppMediaAssetState? = nil,
                    assetToken: String? = nil,
                    assetType: AssetType? = nil,
                    fileName: String? = nil,
                    fileSize: Int? = nil,
                    sourceFileChecksums: Checksums? = nil,
                    uploadOperations: [DeliveryFileUploadOperation]? = nil,
                    uti: Uti? = nil)
        {
            self.assetDeliveryState = assetDeliveryState
            self.assetToken = assetToken
            self.assetType = assetType
            self.fileName = fileName
            self.fileSize = fileSize
            self.sourceFileChecksums = sourceFileChecksums
            self.uploadOperations = uploadOperations
            self.uti = uti
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            assetDeliveryState = try container.decodeIfPresent(AppMediaAssetState.self, forKey: "assetDeliveryState")
            assetToken = try container.decodeIfPresent(String.self, forKey: "assetToken")
            assetType = try container.decodeIfPresent(AssetType.self, forKey: "assetType")
            fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
            fileSize = try container.decodeIfPresent(Int.self, forKey: "fileSize")
            sourceFileChecksums = try container.decodeIfPresent(Checksums.self, forKey: "sourceFileChecksums")
            uploadOperations = try container.decodeIfPresent([DeliveryFileUploadOperation].self, forKey: "uploadOperations")
            uti = try container.decodeIfPresent(Uti.self, forKey: "uti")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(assetDeliveryState, forKey: "assetDeliveryState")
            try container.encodeIfPresent(assetToken, forKey: "assetToken")
            try container.encodeIfPresent(assetType, forKey: "assetType")
            try container.encodeIfPresent(fileName, forKey: "fileName")
            try container.encodeIfPresent(fileSize, forKey: "fileSize")
            try container.encodeIfPresent(sourceFileChecksums, forKey: "sourceFileChecksums")
            try container.encodeIfPresent(uploadOperations, forKey: "uploadOperations")
            try container.encodeIfPresent(uti, forKey: "uti")
        }

        public enum AssetType: String, Sendable, Codable, CaseIterable {
            case asset = "ASSET"
            case assetDescription = "ASSET_DESCRIPTION"
            case assetSpi = "ASSET_SPI"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AssetType(rawValue: string) {
                    self = value
                } else if let value = AssetType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AssetType value: \(string)"
                    )
                }
            }
        }

        public enum Uti: String, Sendable, Codable, CaseIterable {
            case com_apple_binary_property_list = "com.apple.binary-property-list"
            case com_apple_ipa = "com.apple.ipa"
            case com_apple_pkg = "com.apple.pkg"
            case com_apple_xml_property_list = "com.apple.xml-property-list"
            case com_pkware_zip_archive = "com.pkware.zip-archive"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Uti(rawValue: string) {
                    self = value
                } else if let value = Uti(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Uti value: \(string)"
                    )
                }
            }
        }
    }
}
