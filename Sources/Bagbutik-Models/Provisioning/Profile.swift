import Bagbutik_Core
import Foundation

/**
 # Profile
 The data structure that represents a Profiles  resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/profile>
 */
public struct Profile: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "profiles" }
    /// The resource's attributes.
    public var attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    /**
     # Profile.Attributes
     Attributes that describe a Profiles resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/profile/attributes>
     */
    public struct Attributes: Codable {
        public var createdDate: Date?
        public var expirationDate: Date?
        public var name: String?
        public var platform: BundleIdPlatform?
        public var profileContent: String?
        public var profileState: ProfileState?
        public var profileType: ProfileType?
        public var uuid: String?

        public init(createdDate: Date? = nil,
                    expirationDate: Date? = nil,
                    name: String? = nil,
                    platform: BundleIdPlatform? = nil,
                    profileContent: String? = nil,
                    profileState: ProfileState? = nil,
                    profileType: ProfileType? = nil,
                    uuid: String? = nil)
        {
            self.createdDate = createdDate
            self.expirationDate = expirationDate
            self.name = name
            self.platform = platform
            self.profileContent = profileContent
            self.profileState = profileState
            self.profileType = profileType
            self.uuid = uuid
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            createdDate = try container.decodeIfPresent(Date.self, forKey: .createdDate)
            expirationDate = try container.decodeIfPresent(Date.self, forKey: .expirationDate)
            name = try container.decodeIfPresent(String.self, forKey: .name)
            platform = try container.decodeIfPresent(BundleIdPlatform.self, forKey: .platform)
            profileContent = try container.decodeIfPresent(String.self, forKey: .profileContent)
            profileState = try container.decodeIfPresent(ProfileState.self, forKey: .profileState)
            profileType = try container.decodeIfPresent(ProfileType.self, forKey: .profileType)
            uuid = try container.decodeIfPresent(String.self, forKey: .uuid)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(createdDate, forKey: .createdDate)
            try container.encodeIfPresent(expirationDate, forKey: .expirationDate)
            try container.encodeIfPresent(name, forKey: .name)
            try container.encodeIfPresent(platform, forKey: .platform)
            try container.encodeIfPresent(profileContent, forKey: .profileContent)
            try container.encodeIfPresent(profileState, forKey: .profileState)
            try container.encodeIfPresent(profileType, forKey: .profileType)
            try container.encodeIfPresent(uuid, forKey: .uuid)
        }

        private enum CodingKeys: String, CodingKey {
            case createdDate
            case expirationDate
            case name
            case platform
            case profileContent
            case profileState
            case profileType
            case uuid
        }

        public enum ProfileState: String, ParameterValue, Codable, CaseIterable {
            case active = "ACTIVE"
            case invalid = "INVALID"
        }

        public enum ProfileType: String, ParameterValue, Codable, CaseIterable {
            case iOSAppAdhoc = "IOS_APP_ADHOC"
            case iOSAppDevelopment = "IOS_APP_DEVELOPMENT"
            case iOSAppInhouse = "IOS_APP_INHOUSE"
            case iOSAppStore = "IOS_APP_STORE"
            case macAppDevelopment = "MAC_APP_DEVELOPMENT"
            case macAppDirect = "MAC_APP_DIRECT"
            case macAppStore = "MAC_APP_STORE"
            case macCatalystAppDevelopment = "MAC_CATALYST_APP_DEVELOPMENT"
            case macCatalystAppDirect = "MAC_CATALYST_APP_DIRECT"
            case macCatalystAppStore = "MAC_CATALYST_APP_STORE"
            case tvOSAppAdhoc = "TVOS_APP_ADHOC"
            case tvOSAppDevelopment = "TVOS_APP_DEVELOPMENT"
            case tvOSAppInhouse = "TVOS_APP_INHOUSE"
            case tvOSAppStore = "TVOS_APP_STORE"
        }
    }

    /**
     # Profile.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships>
     */
    public struct Relationships: Codable {
        public var bundleId: BundleId?
        public var certificates: Certificates?
        public var devices: Devices?

        public init(bundleId: BundleId? = nil,
                    certificates: Certificates? = nil,
                    devices: Devices? = nil)
        {
            self.bundleId = bundleId
            self.certificates = certificates
            self.devices = devices
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            bundleId = try container.decodeIfPresent(BundleId.self, forKey: .bundleId)
            certificates = try container.decodeIfPresent(Certificates.self, forKey: .certificates)
            devices = try container.decodeIfPresent(Devices.self, forKey: .devices)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(bundleId, forKey: .bundleId)
            try container.encodeIfPresent(certificates, forKey: .certificates)
            try container.encodeIfPresent(devices, forKey: .devices)
        }

        private enum CodingKeys: String, CodingKey {
            case bundleId
            case certificates
            case devices
        }

        /**
         # Profile.Relationships.BundleId
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/bundleid>
         */
        public struct BundleId: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            /**
             # Profile.Relationships.BundleId.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/bundleid/data>
             */
            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "bundleIds" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    id = try container.decode(String.self, forKey: .id)
                    if try container.decode(String.self, forKey: .type) != type {
                        throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(id, forKey: .id)
                    try container.encode(type, forKey: .type)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            /**
             # Profile.Relationships.BundleId.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/bundleid/links>
             */
            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        /**
         # Profile.Relationships.Certificates
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/certificates>
         */
        public struct Certificates: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            /**
             # Profile.Relationships.Certificates.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/certificates/data>
             */
            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "certificates" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    id = try container.decode(String.self, forKey: .id)
                    if try container.decode(String.self, forKey: .type) != type {
                        throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(id, forKey: .id)
                    try container.encode(type, forKey: .type)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            /**
             # Profile.Relationships.Certificates.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/certificates/links>
             */
            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        /**
         # Profile.Relationships.Devices
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/devices>
         */
        public struct Devices: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            /**
             # Profile.Relationships.Devices.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/devices/data>
             */
            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "devices" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    id = try container.decode(String.self, forKey: .id)
                    if try container.decode(String.self, forKey: .type) != type {
                        throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(id, forKey: .id)
                    try container.encode(type, forKey: .type)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            /**
             # Profile.Relationships.Devices.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profile/relationships/devices/links>
             */
            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
