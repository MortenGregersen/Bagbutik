import Foundation

public struct Profile: Codable {
    public let id: String
    public let links: ResourceLinks
    public var type: String { "profiles" }
    public let attributes: Attributes?
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
        case attributes
        case relationships
    }

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
            case tvosAppDevelopment = "TVOS_APP_DEVELOPMENT"
            case tvosAppStore = "TVOS_APP_STORE"
            case tvosAppAdhoc = "TVOS_APP_ADHOC"
            case tvosAppInhouse = "TVOS_APP_INHOUSE"
            case macCatalystAppDevelopment = "MAC_CATALYST_APP_DEVELOPMENT"
            case macCatalystAppStore = "MAC_CATALYST_APP_STORE"
            case macCatalystAppDirect = "MAC_CATALYST_APP_DIRECT"
        }
    }

    public struct Relationships: Codable {
        public let bundleId: BundleId?
        public let certificates: Certificates?
        public let devices: Devices?

        public init(bundleId: BundleId? = nil, certificates: Certificates? = nil, devices: Devices? = nil) {
            self.bundleId = bundleId
            self.certificates = certificates
            self.devices = devices
        }

        public struct BundleId: Codable {
            public let data: Data?
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            public struct Data: Codable {
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
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            public struct Links: Codable {
                public let related: String?
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }

        public struct Certificates: Codable {
            public let data: [Data]?
            public let links: Links?
            public let meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public struct Data: Codable {
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
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            public struct Links: Codable {
                public let related: String?
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }

        public struct Devices: Codable {
            public let data: [Data]?
            public let links: Links?
            public let meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public struct Data: Codable {
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
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            public struct Links: Codable {
                public let related: String?
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
