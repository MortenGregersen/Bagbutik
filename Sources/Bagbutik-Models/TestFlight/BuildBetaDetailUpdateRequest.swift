import Bagbutik_Core
import Foundation

/**
 # BuildBetaDetailUpdateRequest
 The request body you use to update a Build Data Detail.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailupdaterequest>
 */
public struct BuildBetaDetailUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    /**
     # BuildBetaDetailUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "buildBetaDetails" }
        /// The resource's attributes.
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        /**
         # BuildBetaDetailUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// A Boolean value that enables you to send test invitations to users automatically when the build is available to external groups.
            public var autoNotifyEnabled: Bool?

            public init(autoNotifyEnabled: Bool? = nil) {
                self.autoNotifyEnabled = autoNotifyEnabled
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                autoNotifyEnabled = try container.decodeIfPresent(Bool.self, forKey: "autoNotifyEnabled")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(autoNotifyEnabled, forKey: "autoNotifyEnabled")
            }
        }
    }
}
