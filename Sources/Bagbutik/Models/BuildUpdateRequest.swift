import Foundation

/**
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
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "builds" }
        /// The resource's attributes.
        public let attributes: Attributes?
        /// The types and IDs of the related data to update.
        public let relationships: Relationships?

        public init(id: String, attributes: Attributes? = nil, relationships: Relationships? = nil) {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// A Boolean value that indicates if the build has expired. An expired build is unavailable for testing.
            public let expired: Bool?
            /// A Boolean value that indicates whether the build uses non-exempt encryption.
            public let usesNonExemptEncryption: Bool?

            public init(expired: Bool? = nil, usesNonExemptEncryption: Bool? = nil) {
                self.expired = expired
                self.usesNonExemptEncryption = usesNonExemptEncryption
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appEncryptionDeclaration: AppEncryptionDeclaration?

            public init(appEncryptionDeclaration: AppEncryptionDeclaration? = nil) {
                self.appEncryptionDeclaration = appEncryptionDeclaration
            }

            public struct AppEncryptionDeclaration: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/buildupdaterequest/data/relationships/appencryptiondeclaration/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appEncryptionDeclarations" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }
        }
    }
}
