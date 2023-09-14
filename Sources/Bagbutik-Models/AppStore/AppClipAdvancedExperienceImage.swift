import Bagbutik_Core
import Foundation

/**
 # AppClipAdvancedExperienceImage
 The data structure that represents an image that appears on the App Clip card for an advanced App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimage>
 */
public struct AppClipAdvancedExperienceImage: Codable, Identifiable {
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

    /**
     # AppClipAdvancedExperienceImage.Attributes
     The attributes that describe an Advanced App Clip Experience Images resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimage/attributes>
     */
    public struct Attributes: Codable {
        /// The state of the App Clip card image asset you uploaded.
        public var assetDeliveryState: AppMediaAssetState?
        /// The filename of the image asset that appears on the App Clip card for the advanced App Clip experience.
        public var fileName: String?
        /// The size of the image asset that appears on the App Clip card for the advanced App Clip experience.
        public var fileSize: Int?
        /// The image asset that appears on the App Clip card of an advanced App Clip experience.
        public var imageAsset: ImageAsset?
        /// A string that represents the MD5 checksum of the image asset you use for the App Clip card.
        public var sourceFileChecksum: String?
        /// Upload operations for the image asset that appears on the App Clip card for an advanced App Clip experience.
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
    }
}
