import Bagbutik_Core
import Foundation

/**
 # UserUpdateRequest
 The request body you use to update a User.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/userupdaterequest>
 */
public struct UserUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # UserUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/userupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "users" }
        /// The resource's attributes.
        public var attributes: Attributes?
        /// The types and IDs of the related data to update.
        public var relationships: Relationships?

        public init(id: String,
                    attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case id
            case relationships
            case type
        }

        /**
         # UserUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/userupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.
            public var allAppsVisible: Bool?
            /// A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.
            public var provisioningAllowed: Bool?
            /// Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.
            public var roles: [UserRole]?

            public init(allAppsVisible: Bool? = nil,
                        provisioningAllowed: Bool? = nil,
                        roles: [UserRole]? = nil)
            {
                self.allAppsVisible = allAppsVisible
                self.provisioningAllowed = provisioningAllowed
                self.roles = roles
            }
        }

        /**
         # UserUpdateRequest.Data.Relationships
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/userupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public var visibleApps: VisibleApps?

            public init(visibleApps: VisibleApps? = nil) {
                self.visibleApps = visibleApps
            }

            /**
             # UserUpdateRequest.Data.Relationships.VisibleApps
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/userupdaterequest/data/relationships/visibleapps>
             */
            public struct VisibleApps: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent([Data].self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # UserUpdateRequest.Data.Relationships.VisibleApps.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/userupdaterequest/data/relationships/visibleapps/data>
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
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        id = try container.decode(String.self, forKey: .id)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
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
