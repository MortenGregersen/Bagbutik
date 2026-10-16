import BagbutikCore
import Foundation

/**
 # AppAssetLibraryVideo

 A video asset uploaded to an app’s asset library that you can reuse across App Store surfaces through placements.

 ```
 object AppAssetLibraryVideo
 ```

 ## Topics

 ### Objects

 [`object AppAssetLibraryVideo.Relationships`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryVideo/Relationships-data.dictionary)

 The relationships you include in the request and those on which you can operate.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryvideo>
 */
public struct AppAssetLibraryVideo: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appAssetLibraryVideos" }
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

    public enum Attributes: Codable, Sendable {
        case appAssetLibraryVideoAcceptedAttributes(AppAssetLibraryVideoAcceptedAttributes)
        case appAssetLibraryVideoApprovedAttributes(AppAssetLibraryVideoApprovedAttributes)
        case appAssetLibraryVideoArchivedAttributes(AppAssetLibraryVideoArchivedAttributes)
        case appAssetLibraryVideoAwaitingUploadAttributes(AppAssetLibraryVideoAwaitingUploadAttributes)
        case appAssetLibraryVideoCommonAttributes(AppAssetLibraryVideoCommonAttributes)
        case appAssetLibraryVideoFailedAttributes(AppAssetLibraryVideoFailedAttributes)
        case appAssetLibraryVideoInReviewAttributes(AppAssetLibraryVideoInReviewAttributes)
        case appAssetLibraryVideoReadyForReviewAttributes(AppAssetLibraryVideoReadyForReviewAttributes)
        case appAssetLibraryVideoRejectedAttributes(AppAssetLibraryVideoRejectedAttributes)
        case appAssetLibraryVideoUploadCompleteAttributes(AppAssetLibraryVideoUploadCompleteAttributes)
        case appAssetLibraryVideoWaitingForReviewAttributes(AppAssetLibraryVideoWaitingForReviewAttributes)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "state")
            switch discriminatorValue {
            case "ACCEPTED":
                self = .appAssetLibraryVideoAcceptedAttributes(try AppAssetLibraryVideoAcceptedAttributes(from: decoder))
            case "APPROVED":
                self = .appAssetLibraryVideoApprovedAttributes(try AppAssetLibraryVideoApprovedAttributes(from: decoder))
            case "ARCHIVED":
                self = .appAssetLibraryVideoArchivedAttributes(try AppAssetLibraryVideoArchivedAttributes(from: decoder))
            case "AWAITING_UPLOAD":
                self = .appAssetLibraryVideoAwaitingUploadAttributes(try AppAssetLibraryVideoAwaitingUploadAttributes(from: decoder))
            case "COMPLETE":
                self = .appAssetLibraryVideoCommonAttributes(try AppAssetLibraryVideoCommonAttributes(from: decoder))
            case "FAILED":
                self = .appAssetLibraryVideoFailedAttributes(try AppAssetLibraryVideoFailedAttributes(from: decoder))
            case "IN_REVIEW":
                self = .appAssetLibraryVideoInReviewAttributes(try AppAssetLibraryVideoInReviewAttributes(from: decoder))
            case "READY_FOR_REVIEW":
                self = .appAssetLibraryVideoReadyForReviewAttributes(try AppAssetLibraryVideoReadyForReviewAttributes(from: decoder))
            case "REJECTED":
                self = .appAssetLibraryVideoRejectedAttributes(try AppAssetLibraryVideoRejectedAttributes(from: decoder))
            case "UPLOAD_COMPLETE":
                self = .appAssetLibraryVideoUploadCompleteAttributes(try AppAssetLibraryVideoUploadCompleteAttributes(from: decoder))
            case "WAITING_FOR_REVIEW":
                self = .appAssetLibraryVideoWaitingForReviewAttributes(try AppAssetLibraryVideoWaitingForReviewAttributes(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "state",
                    in: container,
                    debugDescription: "Unknown Attributes state '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appAssetLibraryVideoAcceptedAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideoApprovedAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideoArchivedAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideoAwaitingUploadAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideoCommonAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideoFailedAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideoInReviewAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideoReadyForReviewAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideoRejectedAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideoUploadCompleteAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryVideoWaitingForReviewAttributes(value):
                try value.encode(to: encoder)
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var placements: Placements?

        public init(placements: Placements? = nil) {
            self.placements = placements
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            placements = try container.decodeIfPresent(Placements.self, forKey: "placements")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(placements, forKey: "placements")
        }

        public struct Placements: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: RelationshipLinks?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: RelationshipLinks? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "appAssetLibraryPlacements" }

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
