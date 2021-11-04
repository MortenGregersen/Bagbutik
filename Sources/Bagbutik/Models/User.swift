import Foundation

/**
 The data structure that represents a Users resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/user>
 */
public struct User: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "users" }
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
     Attributes that describe a Users resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/user/attributes>
     */
    public struct Attributes: Codable {
        /// A Boolean value that indicates whether a user has access to all apps available to the team.
        public let allAppsVisible: Bool?
        /// The user's first name.
        public let firstName: String?
        /// The user's last name.
        public let lastName: String?
        /// A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.
        public let provisioningAllowed: Bool?
        /// Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.
        public let roles: [UserRole]?
        /// The user's Apple ID.
        public let username: String?

        public init(allAppsVisible: Bool? = nil, firstName: String? = nil, lastName: String? = nil, provisioningAllowed: Bool? = nil, roles: [UserRole]? = nil, username: String? = nil) {
            self.allAppsVisible = allAppsVisible
            self.firstName = firstName
            self.lastName = lastName
            self.provisioningAllowed = provisioningAllowed
            self.roles = roles
            self.username = username
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/user/relationships>
     */
    public struct Relationships: Codable {
        public let visibleApps: VisibleApps?

        public init(visibleApps: VisibleApps? = nil) {
            self.visibleApps = visibleApps
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/user/relationships/visibleapps>
         */
        public struct VisibleApps: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/user/relationships/visibleapps/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "apps" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/user/relationships/visibleapps/links>
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
