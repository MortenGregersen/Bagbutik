import Bagbutik_Core
import Foundation

/**
 # BetaTesterCreateRequest
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    /**
     # BetaTesterCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "betaTesters" }
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
         # BetaTesterCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The beta tester's email address, used for sending beta testing invitations.
            public let email: String
            /// The beta tester's first name.
            public var firstName: String?
            /// The beta tester's last name.
            public var lastName: String?

            public init(email: String,
                        firstName: String? = nil,
                        lastName: String? = nil)
            {
                self.email = email
                self.firstName = firstName
                self.lastName = lastName
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                email = try container.decode(String.self, forKey: "email")
                firstName = try container.decodeIfPresent(String.self, forKey: "firstName")
                lastName = try container.decodeIfPresent(String.self, forKey: "lastName")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(email, forKey: "email")
                try container.encodeIfPresent(firstName, forKey: "firstName")
                try container.encodeIfPresent(lastName, forKey: "lastName")
            }
        }

        /**
         # BetaTesterCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public var betaGroups: BetaGroups?
            public var builds: Builds?

            public init(betaGroups: BetaGroups? = nil,
                        builds: Builds? = nil)
            {
                self.betaGroups = betaGroups
                self.builds = builds
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                betaGroups = try container.decodeIfPresent(BetaGroups.self, forKey: "betaGroups")
                builds = try container.decodeIfPresent(Builds.self, forKey: "builds")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(betaGroups, forKey: "betaGroups")
                try container.encodeIfPresent(builds, forKey: "builds")
            }

            /**
             # BetaTesterCreateRequest.Data.Relationships.BetaGroups
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data/relationships/betagroups>
             */
            public struct BetaGroups: Codable {
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
                 # BetaTesterCreateRequest.Data.Relationships.BetaGroups.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data/relationships/betagroups/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "betaGroups" }

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

            /**
             # BetaTesterCreateRequest.Data.Relationships.Builds
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data/relationships/builds>
             */
            public struct Builds: Codable {
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
                 # BetaTesterCreateRequest.Data.Relationships.Builds.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/betatestercreaterequest/data/relationships/builds/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "builds" }

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
