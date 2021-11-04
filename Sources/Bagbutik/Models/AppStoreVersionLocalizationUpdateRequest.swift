import Foundation

/**
 The request body you use to update an App Store Version Localization

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationupdaterequest>
 */
public struct AppStoreVersionLocalizationUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appStoreVersionLocalizations" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionlocalizationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let description: String?
            public let keywords: String?
            public let marketingUrl: String?
            public let promotionalText: String?
            public let supportUrl: String?
            public let whatsNew: String?

            public init(description: String? = nil, keywords: String? = nil, marketingUrl: String? = nil, promotionalText: String? = nil, supportUrl: String? = nil, whatsNew: String? = nil) {
                self.description = description
                self.keywords = keywords
                self.marketingUrl = marketingUrl
                self.promotionalText = promotionalText
                self.supportUrl = supportUrl
                self.whatsNew = whatsNew
            }
        }
    }
}
