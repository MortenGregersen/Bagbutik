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

        public struct Relationships: Codable {
            public var availableTerritories: AvailableTerritories?
            public var prices: Prices?

            public init(availableTerritories: AvailableTerritories? = nil,
                        prices: Prices? = nil)
            {
                self.availableTerritories = availableTerritories
                self.prices = prices
            }

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
