import Bagbutik_Core
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(Data.self, forKey: .data)
        included = try container.decodeIfPresent([AppPriceInlineCreate].self, forKey: .included)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
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
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var availableInNewTerritories: Bool? = nil
            public var bundleId: String?
            public var contentRightsDeclaration: App.Attributes.ContentRightsDeclaration?
            public var primaryLocale: String?
            public var subscriptionStatusUrl: String?
            public var subscriptionStatusUrlForSandbox: String?
            public var subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion?
            public var subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion?

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
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

            public init(bundleId: String? = nil,
                        contentRightsDeclaration: App.Attributes.ContentRightsDeclaration? = nil,
                        primaryLocale: String? = nil,
                        subscriptionStatusUrl: String? = nil,
                        subscriptionStatusUrlForSandbox: String? = nil,
                        subscriptionStatusUrlVersion: SubscriptionStatusUrlVersion? = nil,
                        subscriptionStatusUrlVersionForSandbox: SubscriptionStatusUrlVersion? = nil)
            {
                self.bundleId = bundleId
                self.contentRightsDeclaration = contentRightsDeclaration
                self.primaryLocale = primaryLocale
                self.subscriptionStatusUrl = subscriptionStatusUrl
                self.subscriptionStatusUrlForSandbox = subscriptionStatusUrlForSandbox
                self.subscriptionStatusUrlVersion = subscriptionStatusUrlVersion
                self.subscriptionStatusUrlVersionForSandbox = subscriptionStatusUrlVersionForSandbox
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                availableInNewTerritories = try container.decodeIfPresent(Bool.self, forKey: .availableInNewTerritories)
                bundleId = try container.decodeIfPresent(String.self, forKey: .bundleId)
                contentRightsDeclaration = try container.decodeIfPresent(App.Attributes.ContentRightsDeclaration.self, forKey: .contentRightsDeclaration)
                primaryLocale = try container.decodeIfPresent(String.self, forKey: .primaryLocale)
                subscriptionStatusUrl = try container.decodeIfPresent(String.self, forKey: .subscriptionStatusUrl)
                subscriptionStatusUrlForSandbox = try container.decodeIfPresent(String.self, forKey: .subscriptionStatusUrlForSandbox)
                subscriptionStatusUrlVersion = try container.decodeIfPresent(SubscriptionStatusUrlVersion.self, forKey: .subscriptionStatusUrlVersion)
                subscriptionStatusUrlVersionForSandbox = try container.decodeIfPresent(SubscriptionStatusUrlVersion.self, forKey: .subscriptionStatusUrlVersionForSandbox)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(availableInNewTerritories, forKey: .availableInNewTerritories)
                try container.encodeIfPresent(bundleId, forKey: .bundleId)
                try container.encodeIfPresent(contentRightsDeclaration, forKey: .contentRightsDeclaration)
                try container.encodeIfPresent(primaryLocale, forKey: .primaryLocale)
                try container.encodeIfPresent(subscriptionStatusUrl, forKey: .subscriptionStatusUrl)
                try container.encodeIfPresent(subscriptionStatusUrlForSandbox, forKey: .subscriptionStatusUrlForSandbox)
                try container.encodeIfPresent(subscriptionStatusUrlVersion, forKey: .subscriptionStatusUrlVersion)
                try container.encodeIfPresent(subscriptionStatusUrlVersionForSandbox, forKey: .subscriptionStatusUrlVersionForSandbox)
            }

            private enum CodingKeys: String, CodingKey {
                case availableInNewTerritories
                case bundleId
                case contentRightsDeclaration
                case primaryLocale
                case subscriptionStatusUrl
                case subscriptionStatusUrlForSandbox
                case subscriptionStatusUrlVersion
                case subscriptionStatusUrlVersionForSandbox
            }
        }

        /**
         # AppUpdateRequest.Data.Relationships
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var availableTerritories: AvailableTerritories? = nil
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var prices: Prices? = nil

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(availableTerritories: AvailableTerritories? = nil,
                        prices: Prices? = nil)
            {
                self.availableTerritories = availableTerritories
                self.prices = prices
            }

            public init() {}

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                availableTerritories = try container.decodeIfPresent(AvailableTerritories.self, forKey: .availableTerritories)
                prices = try container.decodeIfPresent(Prices.self, forKey: .prices)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(availableTerritories, forKey: .availableTerritories)
                try container.encodeIfPresent(prices, forKey: .prices)
            }

            private enum CodingKeys: String, CodingKey {
                case availableTerritories
                case prices
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

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent([Data].self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
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

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent([Data].self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
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
