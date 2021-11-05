import Foundation

/**
 The request body you use to update a Build Data Detail.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailupdaterequest>
 */
public struct BuildBetaDetailUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "buildBetaDetails" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// A Boolean value that enables you to send test invitations to users automatically when the build is available to external groups.
            public let autoNotifyEnabled: Bool?

            public init(autoNotifyEnabled: Bool? = nil) {
                self.autoNotifyEnabled = autoNotifyEnabled
            }
        }
    }
}
