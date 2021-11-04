import Foundation

/**
 The request body you use to update localized text that appears on the App Clip card for testers.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationupdaterequest>
 */
public struct BetaAppClipInvocationLocalizationUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaAppClipInvocationLocalizations" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalizationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The title that appears on the App Clip card for an App Clip experience you configure for testers who launch the App Clip using the TestFlight app.
            public let title: String?

            public init(title: String? = nil) {
                self.title = title
            }
        }
    }
}
