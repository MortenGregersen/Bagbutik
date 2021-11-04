import Foundation

/**
 The data structure that represent an App Screenshot Sets resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotset>
 */
public struct AppScreenshotSet: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appScreenshotSets" }
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
     Attributes that describe an App Screenshot Sets resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotset/attributes>
     */
    public struct Attributes: Codable {
        public let screenshotDisplayType: ScreenshotDisplayType?

        public init(screenshotDisplayType: ScreenshotDisplayType? = nil) {
            self.screenshotDisplayType = screenshotDisplayType
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotset/relationships>
     */
    public struct Relationships: Codable {
        public let appScreenshots: AppScreenshots?
        public let appStoreVersionLocalization: AppStoreVersionLocalization?

        public init(appScreenshots: AppScreenshots? = nil, appStoreVersionLocalization: AppStoreVersionLocalization? = nil) {
            self.appScreenshots = appScreenshots
            self.appStoreVersionLocalization = appStoreVersionLocalization
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotset/relationships/appscreenshots>
         */
        public struct AppScreenshots: Codable {
            /// The type and ID of a related resource.
            public let data: [Data]?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?
            /// Paging information for data responses.
            public let meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotset/relationships/appscreenshots/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appScreenshots" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotset/relationships/appscreenshots/links>
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
         <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotset/relationships/appstoreversionlocalization>
         */
        public struct AppStoreVersionLocalization: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotset/relationships/appstoreversionlocalization/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "appStoreVersionLocalizations" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appscreenshotset/relationships/appstoreversionlocalization/links>
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
