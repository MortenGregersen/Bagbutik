import Bagbutik_Core
import Foundation

public struct BetaAppReviewDetailUpdateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "betaAppReviewDetails" }
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

        public struct Attributes: Codable, Sendable {
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
