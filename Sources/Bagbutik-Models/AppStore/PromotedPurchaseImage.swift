import Bagbutik_Core
import Foundation

public struct PromotedPurchaseImage: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "promotedPurchaseImages" }
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

    public struct Attributes: Codable, Sendable {
        public var assetToken: String?
        public var assetType: String?
        public var fileName: String?
        public var fileSize: Int?
        public var imageAsset: ImageAsset?
        public var sourceFileChecksum: String?
        public var state: State?
        public var uploadOperations: [UploadOperation]?

        public init(assetToken: String? = nil,
                    assetType: String? = nil,
                    fileName: String? = nil,
                    fileSize: Int? = nil,
                    imageAsset: ImageAsset? = nil,
                    sourceFileChecksum: String? = nil,
                    state: State? = nil,
                    uploadOperations: [UploadOperation]? = nil)
        {
            self.assetToken = assetToken
            self.assetType = assetType
            self.fileName = fileName
            self.fileSize = fileSize
            self.imageAsset = imageAsset
            self.sourceFileChecksum = sourceFileChecksum
            self.state = state
            self.uploadOperations = uploadOperations
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            assetToken = try container.decodeIfPresent(String.self, forKey: "assetToken")
            assetType = try container.decodeIfPresent(String.self, forKey: "assetType")
            fileName = try container.decodeIfPresent(String.self, forKey: "fileName")
            fileSize = try container.decodeIfPresent(Int.self, forKey: "fileSize")
            imageAsset = try container.decodeIfPresent(ImageAsset.self, forKey: "imageAsset")
            sourceFileChecksum = try container.decodeIfPresent(String.self, forKey: "sourceFileChecksum")
            state = try container.decodeIfPresent(State.self, forKey: "state")
            uploadOperations = try container.decodeIfPresent([UploadOperation].self, forKey: "uploadOperations")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(assetToken, forKey: "assetToken")
            try container.encodeIfPresent(assetType, forKey: "assetType")
            try container.encodeIfPresent(fileName, forKey: "fileName")
            try container.encodeIfPresent(fileSize, forKey: "fileSize")
            try container.encodeIfPresent(imageAsset, forKey: "imageAsset")
            try container.encodeIfPresent(sourceFileChecksum, forKey: "sourceFileChecksum")
            try container.encodeIfPresent(state, forKey: "state")
            try container.encodeIfPresent(uploadOperations, forKey: "uploadOperations")
        }

        public enum State: String, Sendable, Codable, CaseIterable {
            case approved = "APPROVED"
            case awaitingUpload = "AWAITING_UPLOAD"
            case failed = "FAILED"
            case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
            case rejected = "REJECTED"
            case uploadComplete = "UPLOAD_COMPLETE"
            case waitingForReview = "WAITING_FOR_REVIEW"
        }
    }

    public struct Relationships: Codable, Sendable {
        public var promotedPurchase: PromotedPurchase?

        public init(promotedPurchase: PromotedPurchase? = nil) {
            self.promotedPurchase = promotedPurchase
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            promotedPurchase = try container.decodeIfPresent(PromotedPurchase.self, forKey: "promotedPurchase")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(promotedPurchase, forKey: "promotedPurchase")
        }

        public struct PromotedPurchase: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "promotedPurchases" }

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
        }
    }
}
