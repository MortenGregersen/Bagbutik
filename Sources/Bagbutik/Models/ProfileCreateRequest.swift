import Foundation

/**
 The request body you use to create a Profile.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest>
 */
public struct ProfileCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "profiles" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// The relationships to other resources that you can set with this request.
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

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let name: String
            public let profileType: ProfileType

            public init(name: String, profileType: ProfileType) {
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
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships>
         */
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
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships/bundleid/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
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
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships/certificates/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
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
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships/devices/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
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
