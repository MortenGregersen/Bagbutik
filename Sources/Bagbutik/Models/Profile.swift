import Foundation

/**
 The data structure that represents a Profiles resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/profile>
 */
public struct Profile: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "profiles" }
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
     Attributes that describe a Profiles resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/profile/attributes>
     */
    public struct Attributes: Codable {
        public let createdDate: Date?
        public let expirationDate: Date?
        public let name: String?
        public let platform: BundleIdPlatform?
        public let profileContent: String?
        public let profileState: ProfileState?
        public let profileType: ProfileType?
        public let uuid: String?

        public init(createdDate: Date? = nil, expirationDate: Date? = nil, name: String? = nil, platform: BundleIdPlatform? = nil, profileContent: String? = nil, profileState: ProfileState? = nil, profileType: ProfileType? = nil, uuid: String? = nil) {
            self.createdDate = createdDate
            self.expirationDate = expirationDate
            self.name = name
            self.platform = platform
            self.profileContent = profileContent
            self.profileState = profileState
            self.profileType = profileType
            self.uuid = uuid
        }

        public enum ProfileState: String, Codable, CaseIterable {
            case active = "ACTIVE"
            case invalid = "INVALID"
        }

        public enum ProfileType: String, Codable, CaseIterable {
            case iOSAppDevelopment = "IOS_APP_DEVELOPMENT"
            case iOSAppStore = "IOS_APP_STORE"
            case iOSAppAdhoc = "IOS_APP_ADHOC"
            case iOSAppInhouse = "IOS_APP_INHOUSE"
            case macAppDevelopment = "MAC_APP_DEVELOPMENT"
            case macAppStore = "MAC_APP_STORE"
            case macAppDirect = "MAC_APP_DIRECT"
            case tvOSAppDevelopment = "TVOS_APP_DEVELOPMENT"
            case tvOSAppStore = "TVOS_APP_STORE"
            case tvOSAppAdhoc = "TVOS_APP_ADHOC"
            case tvOSAppInhouse = "TVOS_APP_INHOUSE"
            case macCatalystAppDevelopment = "MAC_CATALYST_APP_DEVELOPMENT"
            case macCatalystAppStore = "MAC_CATALYST_APP_STORE"
            case macCatalystAppDirect = "MAC_CATALYST_APP_DIRECT"
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships>
     */
    public struct Relationships: Codable {
        public let bundleId: BundleId?
        public let certificates: Certificates?
        public let devices: Devices?

        public init(bundleId: BundleId? = nil, certificates: Certificates? = nil, devices: Devices? = nil) {
            self.bundleId = bundleId
            self.certificates = certificates
            self.devices = devices
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/bundleid>
         */
        public struct BundleId: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/bundleid/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "bundleIds" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/bundleid/links>
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
         <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/certificates>
         */
        public struct Certificates: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/certificates/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "certificates" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/certificates/links>
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
         <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/devices>
         */
        public struct Devices: Codable {
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
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/devices/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "devices" }

                public init(id: String) {
                    self.id = id
                }
            }

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/devices/links>
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
