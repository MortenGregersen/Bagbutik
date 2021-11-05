import Foundation

/**
 The data structure that represents the image that appears on the App Clip card of a default App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage>
 */
public struct AppClipHeaderImage: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appClipHeaderImages" }
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
     The attributes that describe the image that appears on the App Clip card of a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage/attributes>
     */
    public struct Attributes: Codable {
        /// The state of the App Clip card image asset you uploaded.
        public let assetDeliveryState: AppMediaAssetState?
        /// The filename of the image asset that appears on the App Clip card for the default App Clip experience.
        public let fileName: String?
        /// The size of the image asset that appears on the App Clip card for the default App Clip experience.
        public let fileSize: Int?
        /// The image asset that appears on the App Clip card of a default App Clip experience.
        public let imageAsset: ImageAsset?
        /// A string that represents the MD5 checksum of the image asset you use for the App Clip card.
        public let sourceFileChecksum: String?
        /// Upload operations for the image asset that appears on the App Clip card for a default App Clip experience.
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

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage/relationships>
     */
    public struct Relationships: Codable {
        public let appClipDefaultExperienceLocalization: AppClipDefaultExperienceLocalization?

        public init(appClipDefaultExperienceLocalization: AppClipDefaultExperienceLocalization? = nil) {
            self.appClipDefaultExperienceLocalization = appClipDefaultExperienceLocalization
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage/relationships/appclipdefaultexperiencelocalization>
         */
        public struct AppClipDefaultExperienceLocalization: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage/relationships/appclipdefaultexperiencelocalization/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipDefaultExperienceLocalizations" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage/relationships/appclipdefaultexperiencelocalization/links>
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
