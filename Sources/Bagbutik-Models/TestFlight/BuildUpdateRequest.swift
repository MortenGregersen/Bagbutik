import Bagbutik_Core
import Foundation

/**
 # BuildUpdateRequest
 The request body you use to update a Build.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildupdaterequest>
 */
public struct BuildUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # BuildUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "builds" }
        /// The resource's attributes.
        public var attributes: Attributes?
        /// Navigational links to related data and included resource types and IDs.
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
         # BuildUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// A Boolean value that indicates if the build has expired. An expired build is unavailable for testing.
            public var expired: Bool?
            /// A Boolean value that indicates whether the build uses non-exempt encryption.
            public var usesNonExemptEncryption: Bool?

            public init(expired: Bool? = nil,
                        usesNonExemptEncryption: Bool? = nil)
            {
                self.expired = expired
                self.usesNonExemptEncryption = usesNonExemptEncryption
            }
        }

        /**
         # BuildUpdateRequest.Data.Relationships
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public var appEncryptionDeclaration: AppEncryptionDeclaration?

            public init(appEncryptionDeclaration: AppEncryptionDeclaration? = nil) {
                self.appEncryptionDeclaration = appEncryptionDeclaration
            }

            /**
             # BuildUpdateRequest.Data.Relationships.AppEncryptionDeclaration
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/buildupdaterequest/data/relationships/appencryptiondeclaration>
             */
            public struct AppEncryptionDeclaration: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # BuildUpdateRequest.Data.Relationships.AppEncryptionDeclaration.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/buildupdaterequest/data/relationships/appencryptiondeclaration/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appEncryptionDeclarations" }

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
