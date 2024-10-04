import Bagbutik_Core
import Foundation

/**
 # AppClipAdvancedExperienceImage
 The data structure that represents an image that appears on the App Clip card for an advanced App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimage>
 */
public struct AppClipAdvancedExperienceImage: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies an Advanced App Clip Experience Images resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "appClipAdvancedExperienceImages" }
    /// The attributes that describe the Advanced App Clip Experience Images resource.
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
        public var fileName: String?
        public var fileSize: Int?
        public var imageAsset: ImageAsset?
        public var sourceFileChecksum: String?
        public var uploadOperations: [UploadOperation]?

        public init(assetDeliveryState: AppMediaAssetState? = nil,
                    fileName: String? = nil,
                    fileSize: Int? = nil,
                    imageAsset: ImageAsset? = nil,
                    sourceFileChecksum: String? = nil,
                    uploadOperations: [UploadOperation]? = nil)
        {
            self.assetDeliveryState = assetDeliveryState
            self.fileName = fileName
            self.fileSize = fileSize
            self.imageAsset = imageAsset
            self.sourceFileChecksum = sourceFileChecksum
            self.uploadOperations = uploadOperations
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            assetDeliveryState = try container.decodeIfPresent(AppMediaAssetState.self, forKey: "assetDeliveryState")
            fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
            fileSize = try container.decodeIfPresent(Int.self, forKey: "fileSize")
            imageAsset = try container.decodeIfPresent(ImageAsset.self, forKey: "imageAsset")
            sourceFileChecksum = try container.decodeIfPresent(String.self, forKey: "sourceFileChecksum")
            uploadOperations = try container.decodeIfPresent([UploadOperation].self, forKey: "uploadOperations")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(assetDeliveryState, forKey: "assetDeliveryState")
            try container.encodeIfPresent(fileName, forKey: "fileName")
            try container.encodeIfPresent(fileSize, forKey: "fileSize")
            try container.encodeIfPresent(imageAsset, forKey: "imageAsset")
            try container.encodeIfPresent(sourceFileChecksum, forKey: "sourceFileChecksum")
            try container.encodeIfPresent(uploadOperations, forKey: "uploadOperations")
        }
    }
}
