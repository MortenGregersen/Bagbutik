import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppClipAppStoreReviewDetailUpdateRequest
 The request body you use to update App Clip information that you provide to App Store Review.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailupdaterequest>
 */
public struct AppClipAppStoreReviewDetailUpdateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "appClipAppStoreReviewDetails" }
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

        public struct Attributes: Codable, Sendable {
            public var invocationUrls: [String]?

            public init(invocationUrls: [String]? = nil) {
                self.invocationUrls = invocationUrls
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                invocationUrls = try container.decodeIfPresent([String].self, forKey: "invocationUrls")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(invocationUrls, forKey: "invocationUrls")
            }
        }
    }
}
