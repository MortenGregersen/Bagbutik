import Foundation

/**
 The request body you use to update a Beta Group.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupupdaterequest>
 */
public struct BetaGroupUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betagroupupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaGroups" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betagroupupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let feedbackEnabled: Bool?
            public let iosBuildsAvailableForAppleSiliconMac: Bool?
            /// The name for the beta group.
            public let name: String?
            /// A Boolean value that indicates whether a public link is enabled. Enabling a link allows you to invite anyone outside of your team to beta test your app. When you share this link, testers will be able to install the beta version of your app on their devices in TestFlight and share the link with others.
            public let publicLinkEnabled: Bool?
            /// The maximum number of testers that can join this beta group using the public link. Values must be between 1 and 10,000.
            public let publicLinkLimit: Int?
            /// A Boolean value that limits the number of testers who can join the beta group using the public link.
            public let publicLinkLimitEnabled: Bool?

            public init(feedbackEnabled: Bool? = nil, iosBuildsAvailableForAppleSiliconMac: Bool? = nil, name: String? = nil, publicLinkEnabled: Bool? = nil, publicLinkLimit: Int? = nil, publicLinkLimitEnabled: Bool? = nil) {
                self.feedbackEnabled = feedbackEnabled
                self.iosBuildsAvailableForAppleSiliconMac = iosBuildsAvailableForAppleSiliconMac
                self.name = name
                self.publicLinkEnabled = publicLinkEnabled
                self.publicLinkLimit = publicLinkLimit
                self.publicLinkLimitEnabled = publicLinkLimitEnabled
            }
        }
    }
}
