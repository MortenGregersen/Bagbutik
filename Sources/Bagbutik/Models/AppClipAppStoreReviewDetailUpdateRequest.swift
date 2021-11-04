import Foundation

/**
 The request body you use to update App Clip information that you provide to App Store Review.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailupdaterequest>
 */
public struct AppClipAppStoreReviewDetailUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appClipAppStoreReviewDetails" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// An array of invocation URLs for your App Clip.
            public let invocationUrls: String?

            public init(invocationUrls: String? = nil) {
                self.invocationUrls = invocationUrls
            }
        }
    }
}
