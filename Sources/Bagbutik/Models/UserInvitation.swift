import Foundation

/// The data structure that represents a User Invitations resource.
public struct UserInvitation: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "userInvitations" }
    /// The resource's attributes.
    public let attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
        case attributes
        case relationships
    }

    /// Attributes that describe a User Invitations resource.
    public struct Attributes: Codable {
        /// A Boolean value that indicates whether a user has access to all apps available to the team.
        public let allAppsVisible: Bool?
        /// The email address of a pending user invitation. The email address must be valid to activate the account. It can be any email address, not necessarily one associated with an Apple ID.
        public let email: String?
        /// The expiration date of the pending invitation.
        public let expirationDate: Date?
        /// The first name of the user with the pending user invitation.
        public let firstName: String?
        /// The last name of the user with the pending user invitation.
        public let lastName: String?
        /// A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.
        public let provisioningAllowed: Bool?
        /// Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.
        public let roles: [UserRole]?

        public init(allAppsVisible: Bool? = nil, email: String? = nil, expirationDate: Date? = nil, firstName: String? = nil, lastName: String? = nil, provisioningAllowed: Bool? = nil, roles: [UserRole]? = nil) {
            self.allAppsVisible = allAppsVisible
            self.email = email
            self.expirationDate = expirationDate
            self.firstName = firstName
            self.lastName = lastName
            self.provisioningAllowed = provisioningAllowed
            self.roles = roles
        }
    }

    /// The relationships you included in the request and those on which you can operate.
    public struct Relationships: Codable {
        public let visibleApps: VisibleApps?

        public init(visibleApps: VisibleApps? = nil) {
            self.visibleApps = visibleApps
        }

        /// The data and links that describe the relationship between the resources.
        public struct VisibleApps: Codable {
            /// The type and ID of a related resource.
            public let data: [Data]?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?
            /// Paging information for data responses.
            public let meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            /// The type and ID of a related resource.
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
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
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            /// The links to the related data and the relationship's self-link.
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
