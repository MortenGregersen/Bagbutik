import Foundation

/**
 The data structure that represent an App Info Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization>
 */
public struct AppInfoLocalization: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appInfoLocalizations" }
    /// The resource's attributes.
    public let attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    /**
     Attributes that describe an App Info Localizations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization/attributes>
     */
    public struct Attributes: Codable {
        public let locale: String?
        public let name: String?
        public let privacyChoicesUrl: String?
        public let privacyPolicyText: String?
        public let privacyPolicyUrl: String?
        public let subtitle: String?

        public init(locale: String? = nil, name: String? = nil, privacyChoicesUrl: String? = nil, privacyPolicyText: String? = nil, privacyPolicyUrl: String? = nil, subtitle: String? = nil) {
            self.locale = locale
            self.name = name
            self.privacyChoicesUrl = privacyChoicesUrl
            self.privacyPolicyText = privacyPolicyText
            self.privacyPolicyUrl = privacyPolicyUrl
            self.subtitle = subtitle
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization/relationships>
     */
    public struct Relationships: Codable {
        public let appInfo: AppInfo?

        public init(appInfo: AppInfo? = nil) {
            self.appInfo = appInfo
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization/relationships/appinfo>
         */
        public struct AppInfo: Codable {
            /// The type and ID of a related resource.
            public let data: Data?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization/relationships/appinfo/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appInfos" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalization/relationships/appinfo/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
