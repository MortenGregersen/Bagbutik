import Foundation

public struct UserInvitationCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable {
        public var type: String { "userInvitations" }
        public let attributes: Attributes
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
            public let email: String?
            public let firstName: String?
            public let lastName: String?
            public let provisioningAllowed: Bool?
            public let roles: [UserRole]?

            public init(allAppsVisible: Bool? = nil, email: String? = nil, firstName: String? = nil, lastName: String? = nil, provisioningAllowed: Bool? = nil, roles: [UserRole]? = nil) {
                self.allAppsVisible = allAppsVisible
                self.email = email
                self.firstName = firstName
                self.lastName = lastName
                self.provisioningAllowed = provisioningAllowed
                self.roles = roles
            }
        }

        public struct Relationships: Codable {
            public let visibleApps: VisibleApps?

            public init(visibleApps: VisibleApps? = nil) {
                self.visibleApps = visibleApps
            }

            public struct VisibleApps: Codable {
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public struct Data: Codable {
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
