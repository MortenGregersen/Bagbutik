import Foundation

/**
 The data structure that represents a Default App Clip Experience Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization>
 */
public struct AppClipDefaultExperienceLocalization: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appClipDefaultExperienceLocalizations" }
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
     The attributes that describe a Default App Clip Experience Localizations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/attributes>
     */
    public struct Attributes: Codable {
        /// The specified locale.
        public let locale: String?
        /// The subtitle that appears on the App Clip card for the default App Clip experience.
        public let subtitle: String?

        public init(locale: String? = nil, subtitle: String? = nil) {
            self.locale = locale
            self.subtitle = subtitle
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships>
     */
    public struct Relationships: Codable {
        public let appClipDefaultExperience: AppClipDefaultExperience?
        public let appClipHeaderImage: AppClipHeaderImage?

        public init(appClipDefaultExperience: AppClipDefaultExperience? = nil, appClipHeaderImage: AppClipHeaderImage? = nil) {
            self.appClipDefaultExperience = appClipDefaultExperience
            self.appClipHeaderImage = appClipHeaderImage
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipdefaultexperience>
         */
        public struct AppClipDefaultExperience: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipdefaultexperience/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipDefaultExperiences" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipdefaultexperience/links>
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

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipheaderimage>
         */
        public struct AppClipHeaderImage: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipheaderimage/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appClipHeaderImages" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencelocalization/relationships/appclipheaderimage/links>
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
