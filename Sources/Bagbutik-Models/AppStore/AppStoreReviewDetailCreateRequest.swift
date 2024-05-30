import Bagbutik_Core
import Foundation

/**
 # AppStoreReviewDetailCreateRequest
 The request body you use to create an App Store Review Detail.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailcreaterequest>
 */
public struct AppStoreReviewDetailCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(Data.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }

    private enum CodingKeys: String, CodingKey {
        case data
    }

    /**
     # AppStoreReviewDetailCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "appStoreReviewDetails" }
        public var attributes: Attributes?
        public let relationships: Relationships

        public init(attributes: Attributes? = nil,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case relationships
            case type
        }

        /**
         # AppStoreReviewDetailCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public var contactEmail: String?
            public var contactFirstName: String?
            public var contactLastName: String?
            public var contactPhone: String?
            public var demoAccountName: String?
            public var demoAccountPassword: String?
            public var demoAccountRequired: Bool?
            public var notes: String?

            public init(contactEmail: String? = nil,
                        contactFirstName: String? = nil,
                        contactLastName: String? = nil,
                        contactPhone: String? = nil,
                        demoAccountName: String? = nil,
                        demoAccountPassword: String? = nil,
                        demoAccountRequired: Bool? = nil,
                        notes: String? = nil)
            {
                self.contactEmail = contactEmail
                self.contactFirstName = contactFirstName
                self.contactLastName = contactLastName
                self.contactPhone = contactPhone
                self.demoAccountName = demoAccountName
                self.demoAccountPassword = demoAccountPassword
                self.demoAccountRequired = demoAccountRequired
                self.notes = notes
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                contactEmail = try container.decodeIfPresent(String.self, forKey: .contactEmail)
                contactFirstName = try container.decodeIfPresent(String.self, forKey: .contactFirstName)
                contactLastName = try container.decodeIfPresent(String.self, forKey: .contactLastName)
                contactPhone = try container.decodeIfPresent(String.self, forKey: .contactPhone)
                demoAccountName = try container.decodeIfPresent(String.self, forKey: .demoAccountName)
                demoAccountPassword = try container.decodeIfPresent(String.self, forKey: .demoAccountPassword)
                demoAccountRequired = try container.decodeIfPresent(Bool.self, forKey: .demoAccountRequired)
                notes = try container.decodeIfPresent(String.self, forKey: .notes)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(contactEmail, forKey: .contactEmail)
                try container.encodeIfPresent(contactFirstName, forKey: .contactFirstName)
                try container.encodeIfPresent(contactLastName, forKey: .contactLastName)
                try container.encodeIfPresent(contactPhone, forKey: .contactPhone)
                try container.encodeIfPresent(demoAccountName, forKey: .demoAccountName)
                try container.encodeIfPresent(demoAccountPassword, forKey: .demoAccountPassword)
                try container.encodeIfPresent(demoAccountRequired, forKey: .demoAccountRequired)
                try container.encodeIfPresent(notes, forKey: .notes)
            }

            private enum CodingKeys: String, CodingKey {
                case contactEmail
                case contactFirstName
                case contactLastName
                case contactPhone
                case demoAccountName
                case demoAccountPassword
                case demoAccountRequired
                case notes
            }
        }

        /**
         # AppStoreReviewDetailCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appStoreVersion: AppStoreVersion

            public init(appStoreVersion: AppStoreVersion) {
                self.appStoreVersion = appStoreVersion
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                appStoreVersion = try container.decode(AppStoreVersion.self, forKey: .appStoreVersion)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(appStoreVersion, forKey: .appStoreVersion)
            }

            private enum CodingKeys: String, CodingKey {
                case appStoreVersion
            }

            /**
             # AppStoreReviewDetailCreateRequest.Data.Relationships.AppStoreVersion
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailcreaterequest/data/relationships/appstoreversion>
             */
            public struct AppStoreVersion: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decode(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # AppStoreReviewDetailCreateRequest.Data.Relationships.AppStoreVersion.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailcreaterequest/data/relationships/appstoreversion/data>
                 */
                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "appStoreVersions" }

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
