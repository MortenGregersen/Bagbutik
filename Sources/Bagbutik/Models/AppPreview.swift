import Foundation

/**
 The data structure that represent an App Previews resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreview>
 */
public struct AppPreview: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appPreviews" }
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
        case id
        case links
        case type
        case attributes
        case relationships
    }

    /**
     Attributes that describe an App Previews resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreview/attributes>
     */
    public struct Attributes: Codable {
        @NullCodable public var assetDeliveryState: AppMediaAssetState?
        @NullCodable public var fileName: String?
        @NullCodable public var fileSize: Int?
        @NullCodable public var mimeType: String?
        @NullCodable public var previewFrameTimeCode: String?
        @NullCodable public var previewImage: ImageAsset?
        @NullCodable public var sourceFileChecksum: String?
        @NullCodable public var uploadOperations: [UploadOperation]?
        @NullCodable public var videoUrl: String?

        public init(assetDeliveryState: AppMediaAssetState? = nil, fileName: String? = nil, fileSize: Int? = nil, mimeType: String? = nil, previewFrameTimeCode: String? = nil, previewImage: ImageAsset? = nil, sourceFileChecksum: String? = nil, uploadOperations: [UploadOperation]? = nil, videoUrl: String? = nil) {
            self.assetDeliveryState = assetDeliveryState
            self.fileName = fileName
            self.fileSize = fileSize
            self.mimeType = mimeType
            self.previewFrameTimeCode = previewFrameTimeCode
            self.previewImage = previewImage
            self.sourceFileChecksum = sourceFileChecksum
            self.uploadOperations = uploadOperations
            self.videoUrl = videoUrl
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreview/relationships>
     */
    public struct Relationships: Codable {
        @NullCodable public var appPreviewSet: AppPreviewSet?

        public init(appPreviewSet: AppPreviewSet? = nil) {
            self.appPreviewSet = appPreviewSet
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppreview/relationships/apppreviewset>
         */
        public struct AppPreviewSet: Codable {
            /// The type and ID of a related resource.
            @NullCodable public var data: Data?
            /// The links to the related data and the relationship's self-link.
            @NullCodable public var links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/apppreview/relationships/apppreviewset/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appPreviewSets" }

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
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/apppreview/relationships/apppreviewset/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                @NullCodable public var related: String?
                /// The relationship's self-link
                @NullCodable public var `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
