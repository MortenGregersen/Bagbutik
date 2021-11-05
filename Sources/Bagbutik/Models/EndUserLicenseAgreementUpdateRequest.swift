import Foundation

/**
 The request body you use to update an End User License Agreement.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementupdaterequest>
 */
public struct EndUserLicenseAgreementUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "endUserLicenseAgreements" }
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
         <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let agreementText: String?

            public init(agreementText: String? = nil) {
                self.agreementText = agreementText
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let territories: Territories?

            public init(territories: Territories? = nil) {
                self.territories = territories
            }

            public struct Territories: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/enduserlicenseagreementupdaterequest/data/relationships/territories/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "territories" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }
        }
    }
}
