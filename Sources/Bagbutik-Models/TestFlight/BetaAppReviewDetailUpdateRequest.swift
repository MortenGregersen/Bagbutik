import Bagbutik_Core
import Foundation

/**
 # BetaAppReviewDetailUpdateRequest
 The request body you use to update a Beta App Review Detail.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetailupdaterequest>
 */
public struct BetaAppReviewDetailUpdateRequest: Codable, Sendable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    /**
     # BetaAppReviewDetailUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetailupdaterequest/data>
     */
    public struct Data: Codable, Sendable, Identifiable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaAppReviewDetails" }
        /// The resource's attributes.
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        /**
         # BetaAppReviewDetailUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetailupdaterequest/data/attributes>
         */
        public struct Attributes: Codable, Sendable {
            /// Email address of contact in case communication is needed with the beta app review.
            public var contactEmail: String?
            /// First name of contact in case communication is needed with the beta app review.
            public var contactFirstName: String?
            /// Last name of contact in case communication is needed with the beta app review.
            public var contactLastName: String?
            /// Phone number of contact in case communication is needed with the beta app review.
            public var contactPhone: String?
            /// The user name to sign in to your app to review its features.
            public var demoAccountName: String?
            /// The password to sign in to your app to review its features.
            public var demoAccountPassword: String?
            /// A Boolean value that indicates if sign-in information is required to review all the features of your app. If users sign in using social media, provide information for an account for review. Credentials must be valid and active for duration of review.
            public var demoAccountRequired: Bool?
            /// Additional information about your app that can help during the review process. Do not include demo account details. Review notes have a maximum of 4,000 characters.
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
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                contactEmail = try container.decodeIfPresent(String.self, forKey: "contactEmail")
                contactFirstName = try container.decodeIfPresent(String.self, forKey: "contactFirstName")
                contactLastName = try container.decodeIfPresent(String.self, forKey: "contactLastName")
                contactPhone = try container.decodeIfPresent(String.self, forKey: "contactPhone")
                demoAccountName = try container.decodeIfPresent(String.self, forKey: "demoAccountName")
                demoAccountPassword = try container.decodeIfPresent(String.self, forKey: "demoAccountPassword")
                demoAccountRequired = try container.decodeIfPresent(Bool.self, forKey: "demoAccountRequired")
                notes = try container.decodeIfPresent(String.self, forKey: "notes")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(contactEmail, forKey: "contactEmail")
                try container.encodeIfPresent(contactFirstName, forKey: "contactFirstName")
                try container.encodeIfPresent(contactLastName, forKey: "contactLastName")
                try container.encodeIfPresent(contactPhone, forKey: "contactPhone")
                try container.encodeIfPresent(demoAccountName, forKey: "demoAccountName")
                try container.encodeIfPresent(demoAccountPassword, forKey: "demoAccountPassword")
                try container.encodeIfPresent(demoAccountRequired, forKey: "demoAccountRequired")
                try container.encodeIfPresent(notes, forKey: "notes")
            }
        }
    }
}
