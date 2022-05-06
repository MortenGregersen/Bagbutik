import Foundation

/**
 The request body you use to create a Bundle ID Capability.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitycreaterequest>
 */
public struct BundleIdCapabilityCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitycreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "bundleIdCapabilities" }
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
            try container.encode(type, forKey: .type)
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
         <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitycreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let capabilityType: CapabilityType
            public var settings: [CapabilitySetting]?

            public init(capabilityType: CapabilityType, settings: [CapabilitySetting]? = nil) {
                self.capabilityType = capabilityType
                self.settings = settings
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitycreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let bundleId: BundleId

            public init(bundleId: BundleId) {
                self.bundleId = bundleId
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
                 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitycreaterequest/data/relationships/bundleid/data>
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
                        try container.encode(type, forKey: .type)
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
