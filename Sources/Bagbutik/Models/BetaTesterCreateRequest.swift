import Foundation

/**
 The request body you use to create a BetaTester.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest>
 */
public struct BetaTesterCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "betaTesters" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships?

        public init(attributes: Attributes, relationships: Relationships? = nil) {
            self.attributes = attributes
            self.relationships = relationships
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
            case relationships
        }

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The beta tester's email address, used for sending beta testing invitations.
            public let email: String
            /// The beta tester's first name.
            public let firstName: String?
            /// The beta tester's last name.
            public let lastName: String?

            public init(email: String, firstName: String? = nil, lastName: String? = nil) {
                self.email = email
                self.firstName = firstName
                self.lastName = lastName
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let betaGroups: BetaGroups?
            public let builds: Builds?

            public init(betaGroups: BetaGroups? = nil, builds: Builds? = nil) {
                self.betaGroups = betaGroups
                self.builds = builds
            }

            public struct BetaGroups: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data/relationships/betagroups/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "betaGroups" }

                    public init(id: String) {
                        self.id = id
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

            public struct Builds: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data/relationships/builds/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "builds" }

                    public init(id: String) {
                        self.id = id
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
