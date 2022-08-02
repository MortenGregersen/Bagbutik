import Foundation

/**
 # AppUpdateRequest
 The request body you use to update an App Update.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest>
 */
public struct AppUpdateRequest: Codable, RequestBody {
    public let data: Data
    public var included: [AppPriceInlineCreate]?

    public init(data: Data,
                included: [AppPriceInlineCreate]? = nil)
    {
        self.data = data
        self.included = included
    }

    /**
     # AppUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        public let id: String
        public var type: String { "apps" }
        public var attributes: Attributes?
        public var relationships: Relationships?

        public init(id: String,
                    attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case id
            case relationships
            case type
        }

        /**
         # AppUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public var availableInNewTerritories: Bool?
            public var bundleId: String?
            public var contentRightsDeclaration: App.Attributes.ContentRightsDeclaration?
            public var primaryLocale: String?
            public var subscriptionStatusUrl: String?
            public var subscriptionStatusUrlForSandbox: String?
            public var subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion?
            public var subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion?

            public init(availableInNewTerritories: Bool? = nil,
                        bundleId: String? = nil,
                        contentRightsDeclaration: App.Attributes.ContentRightsDeclaration? = nil,
                        primaryLocale: String? = nil,
                        subscriptionStatusUrl: String? = nil,
                        subscriptionStatusUrlForSandbox: String? = nil,
                        subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion? = nil,
                        subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion? = nil)
            {
                self.availableInNewTerritories = availableInNewTerritories
                self.bundleId = bundleId
                self.contentRightsDeclaration = contentRightsDeclaration
                self.primaryLocale = primaryLocale
                self.subscriptionStatusUrl = subscriptionStatusUrl
                self.subscriptionStatusUrlForSandbox = subscriptionStatusUrlForSandbox
                self.subscriptionStatusUrlVersion = subscriptionStatusUrlVersion
                self.subscriptionStatusUrlVersionForSandbox = subscriptionStatusUrlVersionForSandbox
            }
        }

        /**
         # AppUpdateRequest.Data.Relationships
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public var availableTerritories: AvailableTerritories?
            public var prices: Prices?

            public init(availableTerritories: AvailableTerritories? = nil,
                        prices: Prices? = nil)
            {
                self.availableTerritories = availableTerritories
                self.prices = prices
            }

            /**
             # AppUpdateRequest.Data.Relationships.AvailableTerritories
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/relationships/availableterritories>
             */
            public struct AvailableTerritories: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 # AppUpdateRequest.Data.Relationships.AvailableTerritories.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/relationships/availableterritories/data>
                 */
                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "territories" }

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
            }

            /**
             # AppUpdateRequest.Data.Relationships.Prices
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/relationships/prices>
             */
            public struct Prices: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 # AppUpdateRequest.Data.Relationships.Prices.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/relationships/prices/data>
                 */
                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "appPrices" }

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
            }
        }
    }
}
