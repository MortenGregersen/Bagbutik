import Bagbutik_Core
import Foundation

/**
 # AppStoreReviewAttachment
 The data structure that represent an App Store Review Attachments resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachment>
 */
public struct AppStoreReviewAttachment: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appStoreReviewAttachments" }
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
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
     # AppStoreReviewAttachment.Attributes
     Attributes that describe an App Store Review Attachments resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachment/attributes>
     */
    public struct Attributes: Codable {
        public var assetDeliveryState: AppMediaAssetState?
        public var fileName: String?
        public var fileSize: Int?
        public var sourceFileChecksum: String?
        public var uploadOperations: [UploadOperation]?

        public init(assetDeliveryState: AppMediaAssetState? = nil,
                    fileName: String? = nil,
                    fileSize: Int? = nil,
                    sourceFileChecksum: String? = nil,
                    uploadOperations: [UploadOperation]? = nil)
        {
            self.assetDeliveryState = assetDeliveryState
            self.fileName = fileName
            self.fileSize = fileSize
            self.sourceFileChecksum = sourceFileChecksum
            self.uploadOperations = uploadOperations
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            assetDeliveryState = try container.decodeIfPresent(AppMediaAssetState.self, forKey: .assetDeliveryState)
            fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
            fileSize = try container.decodeIfPresent(Int.self, forKey: .fileSize)
            sourceFileChecksum = try container.decodeIfPresent(String.self, forKey: .sourceFileChecksum)
            uploadOperations = try container.decodeIfPresent([UploadOperation].self, forKey: .uploadOperations)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(assetDeliveryState, forKey: .assetDeliveryState)
            try container.encodeIfPresent(fileName, forKey: .fileName)
            try container.encodeIfPresent(fileSize, forKey: .fileSize)
            try container.encodeIfPresent(sourceFileChecksum, forKey: .sourceFileChecksum)
            try container.encodeIfPresent(uploadOperations, forKey: .uploadOperations)
        }

        private enum CodingKeys: String, CodingKey {
            case assetDeliveryState
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations
        }
    }

    /**
     # AppStoreReviewAttachment.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachment/relationships>
     */
    public struct Relationships: Codable {
        public var appStoreReviewDetail: AppStoreReviewDetail?

        public init(appStoreReviewDetail: AppStoreReviewDetail? = nil) {
            self.appStoreReviewDetail = appStoreReviewDetail
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            appStoreReviewDetail = try container.decodeIfPresent(AppStoreReviewDetail.self, forKey: .appStoreReviewDetail)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(appStoreReviewDetail, forKey: .appStoreReviewDetail)
        }

        private enum CodingKeys: String, CodingKey {
            case appStoreReviewDetail
        }

        /**
         # AppStoreReviewAttachment.Relationships.AppStoreReviewDetail
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachment/relationships/appstorereviewdetail>
         */
        public struct AppStoreReviewDetail: Codable {
            @NullCodable public var data: Data?
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
             # AppStoreReviewAttachment.Relationships.AppStoreReviewDetail.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachment/relationships/appstorereviewdetail/data>
             */
            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appStoreReviewDetails" }

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
             # AppStoreReviewAttachment.Relationships.AppStoreReviewDetail.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewattachment/relationships/appstorereviewdetail/links>
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
