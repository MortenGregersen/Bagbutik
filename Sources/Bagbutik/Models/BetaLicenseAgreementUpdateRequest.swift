import Foundation

/**
 The request body you use to update a Beta License Agreement.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betalicenseagreementupdaterequest>
 */
public struct BetaLicenseAgreementUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betalicenseagreementupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaLicenseAgreements" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betalicenseagreementupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The license agreement text for your beta app that displays to users.
            public let agreementText: String?

            public init(agreementText: String? = nil) {
                self.agreementText = agreementText
            }
        }
    }
}
