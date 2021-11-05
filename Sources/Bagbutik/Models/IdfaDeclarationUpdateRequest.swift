import Foundation

/**
 The request body you use to update an IDFA Declaration.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/idfadeclarationupdaterequest>
 */
public struct IdfaDeclarationUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/idfadeclarationupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "idfaDeclarations" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/idfadeclarationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let attributesActionWithPreviousAd: Bool?
            public let attributesAppInstallationToPreviousAd: Bool?
            public let honorsLimitedAdTracking: Bool?
            public let servesAds: Bool?

            public init(attributesActionWithPreviousAd: Bool? = nil, attributesAppInstallationToPreviousAd: Bool? = nil, honorsLimitedAdTracking: Bool? = nil, servesAds: Bool? = nil) {
                self.attributesActionWithPreviousAd = attributesActionWithPreviousAd
                self.attributesAppInstallationToPreviousAd = attributesAppInstallationToPreviousAd
                self.honorsLimitedAdTracking = honorsLimitedAdTracking
                self.servesAds = servesAds
            }
        }
    }
}
