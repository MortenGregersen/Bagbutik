import Foundation

public struct ProfileCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable {
        public var type: String { "profiles" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
            case relationships
        }

        public struct Attributes: Codable {
            public let name: String?
            public let profileType: ProfileType?

            public init(name: String? = nil, profileType: ProfileType? = nil) {
                self.name = name
                self.profileType = profileType
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
            public let bundleId: BundleId
            public let certificates: Certificates
            public let devices: Devices?

            public init(bundleId: BundleId, certificates: Certificates, devices: Devices? = nil) {
                self.bundleId = bundleId
                self.certificates = certificates
                self.devices = devices
            }

            public struct BundleId: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
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
            }

            public struct Certificates: Codable {
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
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
            }

            public struct Devices: Codable {
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
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
            }
        }
    }
}
