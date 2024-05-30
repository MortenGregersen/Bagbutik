import Bagbutik_Core
import Foundation

public struct AppEventVideoClip: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appEventVideoClips" }
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

    public struct Attributes: Codable {
        public var appEventAssetType: AppEventAssetType?
        public var assetDeliveryState: AppMediaAssetState?
        public var fileName: String?
        public var fileSize: Int?
        public var previewFrameTimeCode: String?
        public var previewImage: ImageAsset?
        public var uploadOperations: [UploadOperation]?
        public var videoUrl: String?

        public init(appEventAssetType: AppEventAssetType? = nil,
                    assetDeliveryState: AppMediaAssetState? = nil,
                    fileName: String? = nil,
                    fileSize: Int? = nil,
                    previewFrameTimeCode: String? = nil,
                    previewImage: ImageAsset? = nil,
                    uploadOperations: [UploadOperation]? = nil,
                    videoUrl: String? = nil)
        {
            self.appEventAssetType = appEventAssetType
            self.assetDeliveryState = assetDeliveryState
            self.fileName = fileName
            self.fileSize = fileSize
            self.previewFrameTimeCode = previewFrameTimeCode
            self.previewImage = previewImage
            self.uploadOperations = uploadOperations
            self.videoUrl = videoUrl
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            appEventAssetType = try container.decodeIfPresent(AppEventAssetType.self, forKey: .appEventAssetType)
            assetDeliveryState = try container.decodeIfPresent(AppMediaAssetState.self, forKey: .assetDeliveryState)
            fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
            fileSize = try container.decodeIfPresent(Int.self, forKey: .fileSize)
            previewFrameTimeCode = try container.decodeIfPresent(String.self, forKey: .previewFrameTimeCode)
            previewImage = try container.decodeIfPresent(ImageAsset.self, forKey: .previewImage)
            uploadOperations = try container.decodeIfPresent([UploadOperation].self, forKey: .uploadOperations)
            videoUrl = try container.decodeIfPresent(String.self, forKey: .videoUrl)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(appEventAssetType, forKey: .appEventAssetType)
            try container.encodeIfPresent(assetDeliveryState, forKey: .assetDeliveryState)
            try container.encodeIfPresent(fileName, forKey: .fileName)
            try container.encodeIfPresent(fileSize, forKey: .fileSize)
            try container.encodeIfPresent(previewFrameTimeCode, forKey: .previewFrameTimeCode)
            try container.encodeIfPresent(previewImage, forKey: .previewImage)
            try container.encodeIfPresent(uploadOperations, forKey: .uploadOperations)
            try container.encodeIfPresent(videoUrl, forKey: .videoUrl)
        }

        private enum CodingKeys: String, CodingKey {
            case appEventAssetType
            case assetDeliveryState
            case fileName
            case fileSize
            case previewFrameTimeCode
            case previewImage
            case uploadOperations
            case videoUrl
        }
    }

    public struct Relationships: Codable {
        public var appEventLocalization: AppEventLocalization?

        public init(appEventLocalization: AppEventLocalization? = nil) {
            self.appEventLocalization = appEventLocalization
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            appEventLocalization = try container.decodeIfPresent(AppEventLocalization.self, forKey: .appEventLocalization)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(appEventLocalization, forKey: .appEventLocalization)
        }

        private enum CodingKeys: String, CodingKey {
            case appEventLocalization
        }

        public struct AppEventLocalization: Codable {
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

            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "appEventLocalizations" }

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
