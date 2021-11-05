import Foundation

/**
 The data structure that represents an image that appears on the App Clip card for an advanced App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimage>
 */
public struct AppClipAdvancedExperienceImage: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appClipAdvancedExperienceImages" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    /**
     The attributes that describe an Advanced App Clip Experience Images resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceimage/attributes>
     */
    public struct Attributes: Codable {
        /// The state of the App Clip card image asset you uploaded.
        public let assetDeliveryState: AppMediaAssetState?
        /// The filename of the image asset that appears on the App Clip card for the advanced App Clip experience.
        public let fileName: String?
        /// The size of the image asset that appears on the App Clip card for the advanced App Clip experience.
        public let fileSize: Int?
        /// The image asset that appears on the App Clip card of an advanced App Clip experience.
        public let imageAsset: ImageAsset?
        /// A string that represents the MD5 checksum of the image asset you use for the App Clip card.
        public let sourceFileChecksum: String?
        /// Upload operations for the image asset that appears on the App Clip card for an advanced App Clip experience.
        public let uploadOperations: [UploadOperation]?

        public init(assetDeliveryState: AppMediaAssetState? = nil, fileName: String? = nil, fileSize: Int? = nil, imageAsset: ImageAsset? = nil, sourceFileChecksum: String? = nil, uploadOperations: [UploadOperation]? = nil) {
            self.assetDeliveryState = assetDeliveryState
            self.fileName = fileName
            self.fileSize = fileSize
            self.imageAsset = imageAsset
            self.sourceFileChecksum = sourceFileChecksum
            self.uploadOperations = uploadOperations
        }
    }
}
