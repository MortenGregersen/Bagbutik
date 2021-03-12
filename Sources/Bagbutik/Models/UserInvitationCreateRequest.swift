import Foundation

/// The request body you use to create a User Invitation.
public struct UserInvitationCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /// The data element of the request body.
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "userInvitations" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// The types and IDs of the related data to update.
        public let relationships: Relationships?

        public init(attributes: Attributes, relationships: Relationships? = nil) {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
            case relationships
        }

        public struct Attributes: Codable {
            public let allAppsVisible: Bool?
            public let email: String
            public let firstName: String
            public let lastName: String
            public let provisioningAllowed: Bool?
            public let roles: [UserRole]

            public init(allAppsVisible: Bool? = nil, email: String, firstName: String, lastName: String, provisioningAllowed: Bool? = nil, roles: [UserRole]) {
                self.allAppsVisible = allAppsVisible
                self.email = email
                self.firstName = firstName
                self.lastName = lastName
                self.provisioningAllowed = provisioningAllowed
                self.roles = roles
            }
        }

        /// The data and links that describe the relationship between the resources.
        public struct Relationships: Codable {
            public let visibleApps: VisibleApps?

            public init(visibleApps: VisibleApps? = nil) {
                self.visibleApps = visibleApps
            }

            public struct VisibleApps: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /// The type and ID of a resource that you're relating with the resource you're updating.
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
            }
        }
    }
}
