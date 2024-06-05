import Bagbutik_Core
import Foundation

/**
 # UserInvitationCreateRequest
 The request body you use to create a User Invitation.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/userinvitationcreaterequest>
 */
public struct UserInvitationCreateRequest: Codable, RequestBody {
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
     # UserInvitationCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/userinvitationcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "userInvitations" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// The types and IDs of the related data to update.
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

        /**
         # UserInvitationCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/userinvitationcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// A Boolean value that indicates whether a user has access to all apps available to the team.
            public var allAppsVisible: Bool?
            /// The email address of a pending user invitation. The email address must be valid to activate the account. It can be any email address, not necessarily one associated with an Apple ID.
            public let email: String
            /// The user invitation recipient's first name.
            public let firstName: String
            /// The user invitation recipient's last name.
            public let lastName: String
            /// A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.
            public var provisioningAllowed: Bool?
            /// Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.
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

        /**
         # UserInvitationCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/userinvitationcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
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

            /**
             # UserInvitationCreateRequest.Data.Relationships.VisibleApps
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/userinvitationcreaterequest/data/relationships/visibleapps>
             */
            public struct VisibleApps: Codable {
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

                /**
                 # UserInvitationCreateRequest.Data.Relationships.VisibleApps.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/userinvitationcreaterequest/data/relationships/visibleapps/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
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
