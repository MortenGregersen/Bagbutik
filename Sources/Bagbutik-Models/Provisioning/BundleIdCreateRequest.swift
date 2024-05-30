import Bagbutik_Core
import Foundation

/**
 # BundleIdCreateRequest
 The request body you use to create a Bundle ID.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcreaterequest>
 */
public struct BundleIdCreateRequest: Codable, RequestBody {
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
     # BundleIdCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "bundleIds" }
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case type
        }

        /**
         # BundleIdCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let identifier: String
            public let name: String
            public let platform: BundleIdPlatform
            public var seedId: String?

            public init(identifier: String,
                        name: String,
                        platform: BundleIdPlatform,
                        seedId: String? = nil)
            {
                self.identifier = identifier
                self.name = name
                self.platform = platform
                self.seedId = seedId
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                identifier = try container.decode(String.self, forKey: .identifier)
                name = try container.decode(String.self, forKey: .name)
                platform = try container.decode(BundleIdPlatform.self, forKey: .platform)
                seedId = try container.decodeIfPresent(String.self, forKey: .seedId)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(identifier, forKey: .identifier)
                try container.encode(name, forKey: .name)
                try container.encode(platform, forKey: .platform)
                try container.encodeIfPresent(seedId, forKey: .seedId)
            }

            private enum CodingKeys: String, CodingKey {
                case identifier
                case name
                case platform
                case seedId
            }
        }
    }
}
