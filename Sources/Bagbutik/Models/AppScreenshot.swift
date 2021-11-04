import Foundation

/**
 The data structure that represent an App Screenshots resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot>
 */
public struct AppScreenshot: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appScreenshots" }
    /// The resource's attributes.
    public let attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    /**
     Attributes that describe an App Screenshots resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot/attributes>
     */
    public struct Attributes: Codable {
        public let assetDeliveryState: AppMediaAssetState?
        public let assetToken: String?
        public let assetType: String?
        public let fileName: String?
        public let fileSize: Int?
        public let imageAsset: ImageAsset?
        public let sourceFileChecksum: String?
        public let uploadOperations: [UploadOperation]?

        public init(assetDeliveryState: AppMediaAssetState? = nil, assetToken: String? = nil, assetType: String? = nil, fileName: String? = nil, fileSize: Int? = nil, imageAsset: ImageAsset? = nil, sourceFileChecksum: String? = nil, uploadOperations: [UploadOperation]? = nil) {
            self.assetDeliveryState = assetDeliveryState
            self.assetToken = assetToken
            self.assetType = assetType
            self.fileName = fileName
            self.fileSize = fileSize
            self.imageAsset = imageAsset
            self.sourceFileChecksum = sourceFileChecksum
            self.uploadOperations = uploadOperations
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot/relationships>
     */
    public struct Relationships: Codable {
        public let appScreenshotSet: AppScreenshotSet?

        public init(appScreenshotSet: AppScreenshotSet? = nil) {
            self.appScreenshotSet = appScreenshotSet
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot/relationships/appscreenshotset>
         */
        public struct AppScreenshotSet: Codable {
            /// The type and ID of a related resource.
            public let data: Data?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot/relationships/appscreenshotset/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appScreenshotSets" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot/relationships/appscreenshotset/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
