import Foundation

/**
 The request body you use to update a Device.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/deviceupdaterequest>
 */
public struct DeviceUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/deviceupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "devices" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/deviceupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let name: String?
            public let status: Device.Attributes.Status?

            public init(name: String? = nil, status: Device.Attributes.Status? = nil) {
                self.name = name
                self.status = status
            }
        }
    }
}
