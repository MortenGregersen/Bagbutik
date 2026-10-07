import BagbutikCore
import Foundation

/**
 # AppAssetLibraryPlacementOrderingRequest

 A request that sets the display order of an app’s asset library placements within a localization.

 ```
 object AppAssetLibraryPlacementOrderingRequest
 ```

 ## Topics

 ### Objects

 [`object AppAssetLibraryPlacementOrderingRequest.Relationships`](https://developer.apple.com/documentation/AppStoreConnectAPI/AppAssetLibraryPlacementOrderingRequest/Relationships-data.dictionary)

 The relationships you include in the request and those on which you can operate.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryplacementorderingrequest>
 */
public struct AppAssetLibraryPlacementOrderingRequest: Codable, Sendable, Identifiable, RequestBody {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "appAssetLibraryPlacementOrderingRequests" }
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
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
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Relationships: Codable, Sendable {
        public var orderedPlacements: OrderedPlacements?

        public init(orderedPlacements: OrderedPlacements? = nil) {
            self.orderedPlacements = orderedPlacements
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            orderedPlacements = try container.decodeIfPresent(OrderedPlacements.self, forKey: "orderedPlacements")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(orderedPlacements, forKey: "orderedPlacements")
        }

        public struct OrderedPlacements: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
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
