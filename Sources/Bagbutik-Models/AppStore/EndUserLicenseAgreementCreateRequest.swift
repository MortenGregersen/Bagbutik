import Bagbutik_Core
import Foundation

/**
 # EndUserLicenseAgreementCreateRequest
 The request body you use to create an End User License Agreement.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementcreaterequest>
 */
public struct EndUserLicenseAgreementCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # EndUserLicenseAgreementCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "endUserLicenseAgreements" }
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
         # EndUserLicenseAgreementCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let agreementText: String

            public init(agreementText: String) {
                self.agreementText = agreementText
            }
        }

        /**
         # EndUserLicenseAgreementCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let app: App
            public let territories: Territories

            public init(app: App,
                        territories: Territories)
            {
                self.app = app
                self.territories = territories
            }

            /**
             # EndUserLicenseAgreementCreateRequest.Data.Relationships.App
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementcreaterequest/data/relationships/app>
             */
            public struct App: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # EndUserLicenseAgreementCreateRequest.Data.Relationships.App.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementcreaterequest/data/relationships/app/data>
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

            /**
             # EndUserLicenseAgreementCreateRequest.Data.Relationships.Territories
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementcreaterequest/data/relationships/territories>
             */
            public struct Territories: Codable {
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                /**
                 # EndUserLicenseAgreementCreateRequest.Data.Relationships.Territories.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementcreaterequest/data/relationships/territories/data>
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
        }
    }
}
