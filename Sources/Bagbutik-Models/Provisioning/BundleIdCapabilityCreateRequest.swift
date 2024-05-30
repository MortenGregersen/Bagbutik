import Bagbutik_Core
import Foundation

/**
 # BundleIdCapabilityCreateRequest
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(Data.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }

    private enum CodingKeys: String, CodingKey {
        case data
    }

    /**
     # BundleIdCapabilityCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitycreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "bundleIdCapabilities" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
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
            case attributes
            case relationships
            case type
        }

        /**
         # BundleIdCapabilityCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitycreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let capabilityType: CapabilityType
            public var settings: [CapabilitySetting]?

            public init(capabilityType: CapabilityType,
                        settings: [CapabilitySetting]? = nil)
            {
                self.capabilityType = capabilityType
                self.settings = settings
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                capabilityType = try container.decode(CapabilityType.self, forKey: .capabilityType)
                settings = try container.decodeIfPresent([CapabilitySetting].self, forKey: .settings)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(capabilityType, forKey: .capabilityType)
                try container.encodeIfPresent(settings, forKey: .settings)
            }

            private enum CodingKeys: String, CodingKey {
                case capabilityType
                case settings
            }
        }

        /**
         # BundleIdCapabilityCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitycreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let bundleId: BundleId

            public init(bundleId: BundleId) {
                self.bundleId = bundleId
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                bundleId = try container.decode(BundleId.self, forKey: .bundleId)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(bundleId, forKey: .bundleId)
            }

            private enum CodingKeys: String, CodingKey {
                case bundleId
            }

            /**
             # BundleIdCapabilityCreateRequest.Data.Relationships.BundleId
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitycreaterequest/data/relationships/bundleid>
             */
            public struct BundleId: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decode(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # BundleIdCapabilityCreateRequest.Data.Relationships.BundleId.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilitycreaterequest/data/relationships/bundleid/data>
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
            }
        }
    }
}
