import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionKeyCreateRequest
 The request body you use to create an alternative distribution key.

 Use this object to create a new alternative distribution key association in App Store Connect. For more infomation about the request that includes this request body, see [Add an alternative distribution key](https://developer.apple.com/documentation/appstoreconnectapi/add_an_alternative_distribution_key).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeycreaterequest>
 */
public struct AlternativeDistributionKeyCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable {
        public var type: String { "alternativeDistributionKeys" }
        public let attributes: Attributes
        public var relationships: Relationships?

        public init(attributes: Attributes,
                    relationships: Relationships? = nil)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case relationships
            case type
        }

        /**
         # AlternativeDistributionKeyCreateRequest.Data.Attributes
         The attributes you set that describe the public key used to create a new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeycreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// To learn more about creating this `publicKey `see, [Creating keys and establishing alternative marketplace connections](https://developer.apple.com/documentation/appstoreconnectapi/alternative_marketplaces_and_web_distribution/alternative_distribution_keys/creating_keys_and_establishing_alternative_marketplace_connections) or [Creating and configuring keys for web distribution](https://developer.apple.com/documentation/appstoreconnectapi/alternative_marketplaces_and_web_distribution/alternative_distribution_keys/creating_and_configuring_keys_for_web_distribution).
            public let publicKey: String

            public init(publicKey: String) {
                self.publicKey = publicKey
            }
        }

        public struct Relationships: Codable {
            public var app: App?

            public init(app: App? = nil) {
                self.app = app
            }

            /**
             # AlternativeDistributionKeyCreateRequest.Data.Relationships.App
             The relationships you included in the request and those on which you can operate.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeycreaterequest/data/relationships/app>
             */
            public struct App: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # AlternativeDistributionKeyCreateRequest.Data.Relationships.App.Data
                 The app that is associated with the alternative distribution key.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeycreaterequest/data/relationships/app/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// This is the Apple app ID for the Marketplace app or your web distribution app. An opaque resource ID that uniquely identifies the resource. Obtain the `apps` ID from the [List Apps](https://developer.apple.com/documentation/appstoreconnectapi/list_apps) response.
                    public let id: String
                    public var type: String { "apps" }

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
