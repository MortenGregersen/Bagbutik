import Bagbutik_Core
import Foundation

/**
 # AppClipHeaderImage
 The data structure that represents the image that appears on the App Clip card of a default App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage>
 */
public struct AppClipHeaderImage: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies an App Clip Header Images resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appClipHeaderImages" }
    /// The attributes that describe the App Clip Header Images resource.
    public var attributes: Attributes?
    /// The navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    /**
     # AppClipHeaderImage.Attributes
     The attributes that describe the image that appears on the App Clip card of a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage/attributes>
     */
    public struct Attributes: Codable {
        /// The state of the App Clip card image asset you uploaded.
        public var assetDeliveryState: AppMediaAssetState?
        /// The filename of the image asset that appears on the App Clip card for the default App Clip experience.
        public var fileName: String?
        /// The size of the image asset that appears on the App Clip card for the default App Clip experience.
        public var fileSize: Int?
        /// The image asset that appears on the App Clip card of a default App Clip experience.
        public var imageAsset: ImageAsset?
        /// A string that represents the MD5 checksum of the image asset you use for the App Clip card.
        public var sourceFileChecksum: String?
        /// Upload operations for the image asset that appears on the App Clip card for a default App Clip experience.
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

    /**
     # AppClipHeaderImage.Relationships
     The relationships of the App Clip Header Images resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage/relationships>
     */
    public struct Relationships: Codable {
        /// The related Default App Clip Experience Localizations resource.
        public var appClipDefaultExperienceLocalization: AppClipDefaultExperienceLocalization?

        public init(appClipDefaultExperienceLocalization: AppClipDefaultExperienceLocalization? = nil) {
            self.appClipDefaultExperienceLocalization = appClipDefaultExperienceLocalization
        }

        /**
         # AppClipHeaderImage.Relationships.AppClipDefaultExperienceLocalization
         The data and links that describe the relationship between the App Clip Header Images and the Default App Clip Experiences resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage/relationships/appclipdefaultexperiencelocalization>
         */
        public struct AppClipDefaultExperienceLocalization: Codable {
            /// The ID and type of the related Default App Clip Experience Localizations resource.
            @NullCodable public var data: Data?
            /// Navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            /**
             # AppClipHeaderImage.Relationships.AppClipDefaultExperienceLocalization.Data
             The type and ID of a related Default App Clip Experience Localizations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage/relationships/appclipdefaultexperiencelocalization/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies a Default App Clip Experience Localizations resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipDefaultExperienceLocalizations" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    id = try container.decode(String.self, forKey: .id)
                    if try container.decode(String.self, forKey: .type) != type {
                        throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(id, forKey: .id)
                    try container.encode(type, forKey: .type)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            /**
             # AppClipHeaderImage.Relationships.AppClipDefaultExperienceLocalization.Links
             The links to the related Default App Clip Experience Localizations resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipheaderimage/relationships/appclipdefaultexperiencelocalization/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
