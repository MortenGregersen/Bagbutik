import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # WebhookUpdateRequest
 The request body you use to update a webhook update request.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/webhookupdaterequest>
 */
public struct WebhookUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "webhooks" }
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
            public var enabled: Bool?
            public var eventTypes: [WebhookEventType]?
            public var name: String?
            public var secret: String?
            public var url: String?

            public init(enabled: Bool? = nil,
                        eventTypes: [WebhookEventType]? = nil,
                        name: String? = nil,
                        secret: String? = nil,
                        url: String? = nil)
            {
                self.enabled = enabled
                self.eventTypes = eventTypes
                self.name = name
                self.secret = secret
                self.url = url
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                enabled = try container.decodeIfPresent(Bool.self, forKey: "enabled")
                eventTypes = try container.decodeIfPresent([WebhookEventType].self, forKey: "eventTypes")
                name = try container.decodeIfPresent(String.self, forKey: "name")
                secret = try container.decodeIfPresent(String.self, forKey: "secret")
                url = try container.decodeIfPresent(String.self, forKey: "url")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(enabled, forKey: "enabled")
                try container.encodeIfPresent(eventTypes, forKey: "eventTypes")
                try container.encodeIfPresent(name, forKey: "name")
                try container.encodeIfPresent(secret, forKey: "secret")
                try container.encodeIfPresent(url, forKey: "url")
            }
        }
    }
}
