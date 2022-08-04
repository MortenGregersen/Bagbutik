import Foundation
import Bagbutik_Core

/**
 # ProfileCreateRequest
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
     # ProfileCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "profiles" }
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
         # ProfileCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let name: String
            public let profileType: Profile.Attributes.ProfileType

            public init(name: String,
                        profileType: Profile.Attributes.ProfileType)
            {
                self.name = name
                self.profileType = profileType
            }
        }

        /**
         # ProfileCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let bundleId: BundleId
            public let certificates: Certificates
            public var devices: Devices?

            public init(bundleId: BundleId,
                        certificates: Certificates,
                        devices: Devices? = nil)
            {
                self.bundleId = bundleId
                self.certificates = certificates
                self.devices = devices
            }

            /**
             # ProfileCreateRequest.Data.Relationships.BundleId
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships/bundleid>
             */
            public struct BundleId: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # ProfileCreateRequest.Data.Relationships.BundleId.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships/bundleid/data>
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

            /**
             # ProfileCreateRequest.Data.Relationships.Certificates
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships/certificates>
             */
            public struct Certificates: Codable {
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                /**
                 # ProfileCreateRequest.Data.Relationships.Certificates.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships/certificates/data>
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
            }

            /**
             # ProfileCreateRequest.Data.Relationships.Devices
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships/devices>
             */
            public struct Devices: Codable {
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 # ProfileCreateRequest.Data.Relationships.Devices.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/profilecreaterequest/data/relationships/devices/data>
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
            }
        }
    }
}
