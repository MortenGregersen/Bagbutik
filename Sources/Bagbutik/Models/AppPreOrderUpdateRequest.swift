import Foundation

/**
 The request body you use to update an App Pre-Order.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreorderupdaterequest>
 */
public struct AppPreOrderUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreorderupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appPreOrders" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/apppreorderupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let appReleaseDate: String?

            public init(appReleaseDate: String? = nil) {
                self.appReleaseDate = appReleaseDate
            }
        }
    }
}
