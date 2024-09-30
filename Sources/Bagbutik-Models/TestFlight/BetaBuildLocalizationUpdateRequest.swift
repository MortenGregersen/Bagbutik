import Bagbutik_Core
import Foundation

/**
 # BetaBuildLocalizationUpdateRequest
 The request body you use to update a Beta Build Localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationupdaterequest>
 */
public struct BetaBuildLocalizationUpdateRequest: Codable, Sendable, RequestBody {
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
     # BetaBuildLocalizationUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationupdaterequest/data>
     */
    public struct Data: Codable, Sendable, Identifiable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaBuildLocalizations" }
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
         # BetaBuildLocalizationUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable, Sendable {
            /// A field that describes changes and additions to a build and indicates features you would like your users to test.
            public var whatsNew: String?

            public init(whatsNew: String? = nil) {
                self.whatsNew = whatsNew
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                whatsNew = try container.decodeIfPresent(String.self, forKey: "whatsNew")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(whatsNew, forKey: "whatsNew")
            }
        }
    }
}
