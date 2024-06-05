import Bagbutik_Core
import Foundation

/**
 # AppScreenshot
 The data structure that represent an App Screenshots resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot>
 */
public struct AppScreenshot: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appScreenshots" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
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
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    /**
     # AppScreenshot.Attributes
     Attributes that describe an App Screenshots resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot/attributes>
     */
    public struct Attributes: Codable {
        public var assetDeliveryState: AppMediaAssetState?
        public var assetToken: String?
        public var assetType: String?
        public var fileName: String?
        public var fileSize: Int?
        public var imageAsset: ImageAsset?
        public var sourceFileChecksum: String?
        public var uploadOperations: [UploadOperation]?

        public init(assetDeliveryState: AppMediaAssetState? = nil,
                    assetToken: String? = nil,
                    assetType: String? = nil,
                    fileName: String? = nil,
                    fileSize: Int? = nil,
                    imageAsset: ImageAsset? = nil,
                    sourceFileChecksum: String? = nil,
                    uploadOperations: [UploadOperation]? = nil)
        {
            self.assetDeliveryState = assetDeliveryState
            self.assetToken = assetToken
            self.assetType = assetType
            self.fileName = fileName
            self.fileSize = fileSize
            self.imageAsset = imageAsset
            self.sourceFileChecksum = sourceFileChecksum
            self.uploadOperations = uploadOperations
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            assetDeliveryState = try container.decodeIfPresent(AppMediaAssetState.self, forKey: "assetDeliveryState")
            assetToken = try container.decodeIfPresent(String.self, forKey: "assetToken")
            assetType = try container.decodeIfPresent(String.self, forKey: "assetType")
            fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
            fileSize = try container.decodeIfPresent(Int.self, forKey: "fileSize")
            imageAsset = try container.decodeIfPresent(ImageAsset.self, forKey: "imageAsset")
            sourceFileChecksum = try container.decodeIfPresent(String.self, forKey: "sourceFileChecksum")
            uploadOperations = try container.decodeIfPresent([UploadOperation].self, forKey: "uploadOperations")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(assetDeliveryState, forKey: "assetDeliveryState")
            try container.encodeIfPresent(assetToken, forKey: "assetToken")
            try container.encodeIfPresent(assetType, forKey: "assetType")
            try container.encodeIfPresent(fileName, forKey: "fileName")
            try container.encodeIfPresent(fileSize, forKey: "fileSize")
            try container.encodeIfPresent(imageAsset, forKey: "imageAsset")
            try container.encodeIfPresent(sourceFileChecksum, forKey: "sourceFileChecksum")
            try container.encodeIfPresent(uploadOperations, forKey: "uploadOperations")
        }
    }

    /**
     # AppScreenshot.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot/relationships>
     */
    public struct Relationships: Codable {
        public var appScreenshotSet: AppScreenshotSet?

        public init(appScreenshotSet: AppScreenshotSet? = nil) {
            self.appScreenshotSet = appScreenshotSet
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appScreenshotSet = try container.decodeIfPresent(AppScreenshotSet.self, forKey: "appScreenshotSet")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appScreenshotSet, forKey: "appScreenshotSet")
        }

        /**
         # AppScreenshot.Relationships.AppScreenshotSet
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot/relationships/appscreenshotset>
         */
        public struct AppScreenshotSet: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            /**
             # AppScreenshot.Relationships.AppScreenshotSet.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot/relationships/appscreenshotset/data>
             */
            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appScreenshotSets" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }

            /**
             # AppScreenshot.Relationships.AppScreenshotSet.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshot/relationships/appscreenshotset/links>
             */
            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
