import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionKeyCreateRequest
 The request body you use to create an alternative distribution key.

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
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case relationships
            case type
        }

        /**
         # AlternativeDistributionKeyCreateRequest.Data.Attributes
         The attribute you set that describes the public key used to create a new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeycreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// To learn more about creating this `publicKey `see, [Creating keys and establishing alternative marketplace connections](https://developer.apple.com/documentation/appstoreconnectapi/app_distribution_for_alternative_marketplaces/alternative_distribution_keys/creating_keys_and_establishing_alternative_marketplace_connections).
            public let publicKey: String

            public init(publicKey: String) {
                self.publicKey = publicKey
            }
        }

        public struct Relationships: Codable {
            public let app: App

            public init(app: App) {
                self.app = app
            }

            /**
             # AlternativeDistributionKeyCreateRequest.Data.Relationships.App
             The relationships you included in the request and those on which you can operate.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeycreaterequest/data/relationships/app>
             */
            public struct App: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # AlternativeDistributionKeyCreateRequest.Data.Relationships.App.Data
                 The app that is associted with the alternative distribution key.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeycreaterequest/data/relationships/app/data>
                 */
                public struct Data: Codable, Identifiable {
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
