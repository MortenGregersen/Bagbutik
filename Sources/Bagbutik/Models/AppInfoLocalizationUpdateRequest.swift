import Foundation

/**
 The request body you use to update an App Info Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationupdaterequest>
 */
public struct AppInfoLocalizationUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appInfoLocalizations" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let name: String?
            public let privacyChoicesUrl: String?
            public let privacyPolicyText: String?
            public let privacyPolicyUrl: String?
            public let subtitle: String?

            public init(name: String? = nil, privacyChoicesUrl: String? = nil, privacyPolicyText: String? = nil, privacyPolicyUrl: String? = nil, subtitle: String? = nil) {
                self.name = name
                self.privacyChoicesUrl = privacyChoicesUrl
                self.privacyPolicyText = privacyPolicyText
                self.privacyPolicyUrl = privacyPolicyUrl
                self.subtitle = subtitle
            }
        }
    }
}
