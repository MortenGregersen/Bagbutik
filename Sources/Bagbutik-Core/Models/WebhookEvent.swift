import Foundation

/**
 # WebhookEvent
 The data structure that represents a webhook event resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/webhookevent>
 */
public struct WebhookEvent: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "webhookEvents" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
        public var createdDate: Date?
        public var eventType: WebhookEventType?
        public var payload: String?
        public var ping: Bool?

        public init(createdDate: Date? = nil,
                    eventType: WebhookEventType? = nil,
                    payload: String? = nil,
                    ping: Bool? = nil)
        {
            self.createdDate = createdDate
            self.eventType = eventType
            self.payload = payload
            self.ping = ping
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            eventType = try container.decodeIfPresent(WebhookEventType.self, forKey: "eventType")
            payload = try container.decodeIfPresent(String.self, forKey: "payload")
            ping = try container.decodeIfPresent(Bool.self, forKey: "ping")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(eventType, forKey: "eventType")
            try container.encodeIfPresent(payload, forKey: "payload")
            try container.encodeIfPresent(ping, forKey: "ping")
        }
    }
}
