import Foundation

/**
 The request body you use to update an App Store Version Phased Release.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedreleaseupdaterequest>
 */
public struct AppStoreVersionPhasedReleaseUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedreleaseupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appStoreVersionPhasedReleases" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionphasedreleaseupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let phasedReleaseState: PhasedReleaseState?

            public init(phasedReleaseState: PhasedReleaseState? = nil) {
                self.phasedReleaseState = phasedReleaseState
            }
        }
    }
}
