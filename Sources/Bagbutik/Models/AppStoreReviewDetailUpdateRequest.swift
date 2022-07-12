import Foundation

/**
 The request body you use to update an App Store Review Detail.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailupdaterequest>
 */
public struct AppStoreReviewDetailUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appStoreReviewDetails" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailupdaterequest/data/attributes>
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

            public init(contactEmail: String? = nil, contactFirstName: String? = nil, contactLastName: String? = nil, contactPhone: String? = nil, demoAccountName: String? = nil, demoAccountPassword: String? = nil, demoAccountRequired: Bool? = nil, notes: String? = nil) {
                self.contactEmail = contactEmail
                self.contactFirstName = contactFirstName
                self.contactLastName = contactLastName
                self.contactPhone = contactPhone
                self.demoAccountName = demoAccountName
                self.demoAccountPassword = demoAccountPassword
                self.demoAccountRequired = demoAccountRequired
                self.notes = notes
            }
        }
    }
}
