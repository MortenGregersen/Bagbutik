import Foundation

/**
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

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "bundleIds" }
        /// The resource's attributes.
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
        }

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let identifier: String
            public let name: String
            public let platform: BundleIdPlatform
            public let seedId: String?

            public init(identifier: String, name: String, platform: BundleIdPlatform, seedId: String? = nil) {
                self.identifier = identifier
                self.name = name
                self.platform = platform
                self.seedId = seedId
            }
        }
    }
}
