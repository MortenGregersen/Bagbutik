import Bagbutik_Core
import Foundation

public struct InAppPurchaseAppStoreReviewScreenshot: Codable, Identifiable {
    public let id: String
    public let links: ResourceLinks
    public var type: String { "inAppPurchaseAppStoreReviewScreenshots" }
    public var attributes: Attributes?
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
    }

    public struct Relationships: Codable {
        public var inAppPurchaseV2: InAppPurchaseV2?

        public init(inAppPurchaseV2: InAppPurchaseV2? = nil) {
            self.inAppPurchaseV2 = inAppPurchaseV2
        }

        public struct InAppPurchaseV2: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "inAppPurchases" }

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
