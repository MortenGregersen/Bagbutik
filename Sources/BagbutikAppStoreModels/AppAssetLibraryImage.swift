import BagbutikCore
import Foundation

/**
 # AppAssetLibraryImage

 An image asset uploaded to an app’s asset library that you can reuse across App Store surfaces through placements.

 ```
 object AppAssetLibraryImage
 ```

 ## Topics

 ### Objects

 [`object AppAssetLibraryImage.Relationships`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryImage/Relationships-data.dictionary)

 The relationships you include in the request and those on which you can operate.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryimage>
 */
public struct AppAssetLibraryImage: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appAssetLibraryImages" }
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
        case appAssetLibraryImageAcceptedAttributes(AppAssetLibraryImageAcceptedAttributes)
        case appAssetLibraryImageApprovedAttributes(AppAssetLibraryImageApprovedAttributes)
        case appAssetLibraryImageArchivedAttributes(AppAssetLibraryImageArchivedAttributes)
        case appAssetLibraryImageAwaitingUploadAttributes(AppAssetLibraryImageAwaitingUploadAttributes)
        case appAssetLibraryImageCommonAttributes(AppAssetLibraryImageCommonAttributes)
        case appAssetLibraryImageFailedAttributes(AppAssetLibraryImageFailedAttributes)
        case appAssetLibraryImageInReviewAttributes(AppAssetLibraryImageInReviewAttributes)
        case appAssetLibraryImageReadyForReviewAttributes(AppAssetLibraryImageReadyForReviewAttributes)
        case appAssetLibraryImageRejectedAttributes(AppAssetLibraryImageRejectedAttributes)
        case appAssetLibraryImageUploadCompleteAttributes(AppAssetLibraryImageUploadCompleteAttributes)
        case appAssetLibraryImageWaitingForReviewAttributes(AppAssetLibraryImageWaitingForReviewAttributes)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "state")
            switch discriminatorValue {
            case "ACCEPTED":
                self = .appAssetLibraryImageAcceptedAttributes(try AppAssetLibraryImageAcceptedAttributes(from: decoder))
            case "APPROVED":
                self = .appAssetLibraryImageApprovedAttributes(try AppAssetLibraryImageApprovedAttributes(from: decoder))
            case "ARCHIVED":
                self = .appAssetLibraryImageArchivedAttributes(try AppAssetLibraryImageArchivedAttributes(from: decoder))
            case "AWAITING_UPLOAD":
                self = .appAssetLibraryImageAwaitingUploadAttributes(try AppAssetLibraryImageAwaitingUploadAttributes(from: decoder))
            case "COMPLETE":
                self = .appAssetLibraryImageCommonAttributes(try AppAssetLibraryImageCommonAttributes(from: decoder))
            case "FAILED":
                self = .appAssetLibraryImageFailedAttributes(try AppAssetLibraryImageFailedAttributes(from: decoder))
            case "IN_REVIEW":
                self = .appAssetLibraryImageInReviewAttributes(try AppAssetLibraryImageInReviewAttributes(from: decoder))
            case "READY_FOR_REVIEW":
                self = .appAssetLibraryImageReadyForReviewAttributes(try AppAssetLibraryImageReadyForReviewAttributes(from: decoder))
            case "REJECTED":
                self = .appAssetLibraryImageRejectedAttributes(try AppAssetLibraryImageRejectedAttributes(from: decoder))
            case "UPLOAD_COMPLETE":
                self = .appAssetLibraryImageUploadCompleteAttributes(try AppAssetLibraryImageUploadCompleteAttributes(from: decoder))
            case "WAITING_FOR_REVIEW":
                self = .appAssetLibraryImageWaitingForReviewAttributes(try AppAssetLibraryImageWaitingForReviewAttributes(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "state",
                    in: container,
                    debugDescription: "Unknown Attributes state '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appAssetLibraryImageAcceptedAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryImageApprovedAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryImageArchivedAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryImageAwaitingUploadAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryImageCommonAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryImageFailedAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryImageInReviewAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryImageReadyForReviewAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryImageRejectedAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryImageUploadCompleteAttributes(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryImageWaitingForReviewAttributes(value):
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
