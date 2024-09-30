import Bagbutik_Core
import Foundation

/**
 # UserInvitation
 The data structure that represents a User Invitations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/userinvitation>
 */
public struct UserInvitation: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "userInvitations" }
    /// The resource's attributes.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    /**
     # UserInvitation.Attributes
     Attributes that describe a User Invitations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/userinvitation/attributes>
     */
    public struct Attributes: Codable, Sendable {
        /// A Boolean value that indicates whether a user has access to all apps available to the team.
        public var allAppsVisible: Bool?
        /// The email address of a pending user invitation. The email address must be valid to activate the account. It can be any email address, not necessarily one associated with an Apple ID.
        public var email: String?
        /// The expiration date of the pending invitation.
        public var expirationDate: Date?
        /// The first name of the user with the pending user invitation.
        public var firstName: String?
        /// The last name of the user with the pending user invitation.
        public var lastName: String?
        /// A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.
        public var provisioningAllowed: Bool?
        /// Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.
        public var roles: [UserRole]?

        public init(allAppsVisible: Bool? = nil,
                    email: String? = nil,
                    expirationDate: Date? = nil,
                    firstName: String? = nil,
                    lastName: String? = nil,
                    provisioningAllowed: Bool? = nil,
                    roles: [UserRole]? = nil)
        {
            self.allAppsVisible = allAppsVisible
            self.email = email
            self.expirationDate = expirationDate
            self.firstName = firstName
            self.lastName = lastName
            self.provisioningAllowed = provisioningAllowed
            self.roles = roles
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            allAppsVisible = try container.decodeIfPresent(Bool.self, forKey: "allAppsVisible")
            email = try container.decodeIfPresent(String.self, forKey: "email")
            expirationDate = try container.decodeIfPresent(Date.self, forKey: "expirationDate")
            firstName = try container.decodeIfPresent(String.self, forKey: "firstName")
            lastName = try container.decodeIfPresent(String.self, forKey: "lastName")
            provisioningAllowed = try container.decodeIfPresent(Bool.self, forKey: "provisioningAllowed")
            roles = try container.decodeIfPresent([UserRole].self, forKey: "roles")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(allAppsVisible, forKey: "allAppsVisible")
            try container.encodeIfPresent(email, forKey: "email")
            try container.encodeIfPresent(expirationDate, forKey: "expirationDate")
            try container.encodeIfPresent(firstName, forKey: "firstName")
            try container.encodeIfPresent(lastName, forKey: "lastName")
            try container.encodeIfPresent(provisioningAllowed, forKey: "provisioningAllowed")
            try container.encodeIfPresent(roles, forKey: "roles")
        }
    }

    /**
     # UserInvitation.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/userinvitation/relationships>
     */
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

        /**
         # UserInvitation.Relationships.VisibleApps
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/userinvitation/relationships/visibleapps>
         */
        public struct VisibleApps: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            /**
             # UserInvitation.Relationships.VisibleApps.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/userinvitation/relationships/visibleapps/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
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

            /**
             # UserInvitation.Relationships.VisibleApps.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/userinvitation/relationships/visibleapps/links>
             */
            public struct Links: Codable, Sendable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
