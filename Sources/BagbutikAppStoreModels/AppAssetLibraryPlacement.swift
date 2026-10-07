import BagbutikCore
import Foundation

/**
 # AppAssetLibraryPlacement

 A placement that positions a library asset on a specific App Store surface.

 ```
 object AppAssetLibraryPlacement
 ```

 ## Topics

 ### Objects

 [`object AppAssetLibraryPlacement.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryPlacement/Attributes-data.dictionary)

 Attributes that describe an app asset library placement resource.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryplacement>
 */
public struct AppAssetLibraryPlacement: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appAssetLibraryPlacements" }
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
        public var createdDate: Date?
        public var lastModifiedDate: Date?
        public var mediaType: AppAssetLibraryMediaType?
        public var placementGroup: String?
        public var placementType: AppAssetLibraryPlacementType?
        public var state: AppAssetLibraryPlacementState?
        public var stateDetails: [StateDetail]?

        public init(createdDate: Date? = nil,
                    lastModifiedDate: Date? = nil,
                    mediaType: AppAssetLibraryMediaType? = nil,
                    placementGroup: String? = nil,
                    placementType: AppAssetLibraryPlacementType? = nil,
                    state: AppAssetLibraryPlacementState? = nil,
                    stateDetails: [StateDetail]? = nil)
        {
            self.createdDate = createdDate
            self.lastModifiedDate = lastModifiedDate
            self.mediaType = mediaType
            self.placementGroup = placementGroup
            self.placementType = placementType
            self.state = state
            self.stateDetails = stateDetails
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            lastModifiedDate = try container.decodeIfPresent(Date.self, forKey: "lastModifiedDate")
            mediaType = try container.decodeIfPresent(AppAssetLibraryMediaType.self, forKey: "mediaType")
            placementGroup = try container.decodeIfPresent(String.self, forKey: "placementGroup")
            placementType = try container.decodeIfPresent(AppAssetLibraryPlacementType.self, forKey: "placementType")
            state = try container.decodeIfPresent(AppAssetLibraryPlacementState.self, forKey: "state")
            stateDetails = try container.decodeIfPresent([StateDetail].self, forKey: "stateDetails")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(lastModifiedDate, forKey: "lastModifiedDate")
            try container.encodeIfPresent(mediaType, forKey: "mediaType")
            try container.encodeIfPresent(placementGroup, forKey: "placementGroup")
            try container.encodeIfPresent(placementType, forKey: "placementType")
            try container.encodeIfPresent(state, forKey: "state")
            try container.encodeIfPresent(stateDetails, forKey: "stateDetails")
        }
    }

    public enum Relationships: Codable, Sendable {
        case appAssetLibraryPlacementImageRelationships(AppAssetLibraryPlacementImageRelationships)
        case appAssetLibraryPlacementVideoRelationships(AppAssetLibraryPlacementVideoRelationships)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "mediaType")
            switch discriminatorValue {
            case "IMAGE":
                self = .appAssetLibraryPlacementImageRelationships(try AppAssetLibraryPlacementImageRelationships(from: decoder))
            case "VIDEO":
                self = .appAssetLibraryPlacementVideoRelationships(try AppAssetLibraryPlacementVideoRelationships(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "mediaType",
                    in: container,
                    debugDescription: "Unknown Relationships mediaType '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .appAssetLibraryPlacementImageRelationships(value):
                try value.encode(to: encoder)
            case let .appAssetLibraryPlacementVideoRelationships(value):
                try value.encode(to: encoder)
            }
        }
    }
}
