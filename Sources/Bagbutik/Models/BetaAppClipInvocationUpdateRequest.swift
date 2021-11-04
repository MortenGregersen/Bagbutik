import Foundation

/**
 The request body you use to update a Beta App Clip Invocation.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationupdaterequest>
 */
public struct BetaAppClipInvocationUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaAppClipInvocations" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The invocation URL you configure for testers who use the TestFlight to launch your App Clip.
            public let url: String?

            public init(url: String? = nil) {
                self.url = url
            }
        }
    }
}
