import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # UserInvitationCreateRequest
 The request body you use to create a User Invitation.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/userinvitationcreaterequest>
 */
public struct UserInvitationCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "userInvitations" }
        public let attributes: Attributes
        public var relationships: Relationships?

        public init(attributes: Attributes,
                    relationships: Relationships? = nil)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public var allAppsVisible: Bool?
            public let email: String
            public let firstName: String
            public let lastName: String
            public var provisioningAllowed: Bool?
            public let roles: [UserRole]

            public init(allAppsVisible: Bool? = nil,
                        email: String,
                        firstName: String,
                        lastName: String,
                        provisioningAllowed: Bool? = nil,
                        roles: [UserRole])
            {
                self.allAppsVisible = allAppsVisible
                self.email = email
                self.firstName = firstName
                self.lastName = lastName
                self.provisioningAllowed = provisioningAllowed
                self.roles = roles
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                allAppsVisible = try container.decodeIfPresent(Bool.self, forKey: "allAppsVisible")
                email = try container.decode(String.self, forKey: "email")
                firstName = try container.decode(String.self, forKey: "firstName")
                lastName = try container.decode(String.self, forKey: "lastName")
                provisioningAllowed = try container.decodeIfPresent(Bool.self, forKey: "provisioningAllowed")
                roles = try container.decode([UserRole].self, forKey: "roles")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(allAppsVisible, forKey: "allAppsVisible")
                try container.encode(email, forKey: "email")
                try container.encode(firstName, forKey: "firstName")
                try container.encode(lastName, forKey: "lastName")
                try container.encodeIfPresent(provisioningAllowed, forKey: "provisioningAllowed")
                try container.encode(roles, forKey: "roles")
            }
        }

        public struct Relationships: Codable, Sendable {
            public var visibleApps: VisibleApps?

            public init(visibleApps: VisibleApps? = nil) {
                self.visibleApps = visibleApps
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                visibleApps = try container.decodeIfPresent(VisibleApps.self, forKey: "visibleApps")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(visibleApps, forKey: "visibleApps")
            }

            public struct VisibleApps: Codable, Sendable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent([Data].self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "apps" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }
        }
    }
}
