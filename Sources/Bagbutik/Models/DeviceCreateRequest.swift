import Foundation

/**
 The request body you use to create a Device.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/devicecreaterequest>
 */
public struct DeviceCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/devicecreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "devices" }
        /// The resource's attributes.
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
            try container.encode(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
        }

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/devicecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let name: String
            public let platform: BundleIdPlatform
            public let udid: String

            public init(name: String, platform: BundleIdPlatform, udid: String) {
                self.name = name
                self.platform = platform
                self.udid = udid
            }
        }
    }
}
