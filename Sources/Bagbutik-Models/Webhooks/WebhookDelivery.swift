import Bagbutik_Core
import Foundation

/**
 # WebhookDelivery
 The data structure that represents a webhook delivery resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/webhookdelivery>
 */
public struct WebhookDelivery: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "webhookDeliveries" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
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
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var createdDate: Date?
        public var deliveryState: DeliveryState?
        public var errorMessage: String?
        public var redelivery: Bool?
        public var request: Request?
        public var response: Response?
        public var sentDate: Date?

        public init(createdDate: Date? = nil,
                    deliveryState: DeliveryState? = nil,
                    errorMessage: String? = nil,
                    redelivery: Bool? = nil,
                    request: Request? = nil,
                    response: Response? = nil,
                    sentDate: Date? = nil)
        {
            self.createdDate = createdDate
            self.deliveryState = deliveryState
            self.errorMessage = errorMessage
            self.redelivery = redelivery
            self.request = request
            self.response = response
            self.sentDate = sentDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            deliveryState = try container.decodeIfPresent(DeliveryState.self, forKey: "deliveryState")
            errorMessage = try container.decodeIfPresent(String.self, forKey: "errorMessage")
            redelivery = try container.decodeIfPresent(Bool.self, forKey: "redelivery")
            request = try container.decodeIfPresent(Request.self, forKey: "request")
            response = try container.decodeIfPresent(Response.self, forKey: "response")
            sentDate = try container.decodeIfPresent(Date.self, forKey: "sentDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(deliveryState, forKey: "deliveryState")
            try container.encodeIfPresent(errorMessage, forKey: "errorMessage")
            try container.encodeIfPresent(redelivery, forKey: "redelivery")
            try container.encodeIfPresent(request, forKey: "request")
            try container.encodeIfPresent(response, forKey: "response")
            try container.encodeIfPresent(sentDate, forKey: "sentDate")
        }

        public enum DeliveryState: String, Sendable, Codable, CaseIterable {
            case failed = "FAILED"
            case pending = "PENDING"
            case succeeded = "SUCCEEDED"
        }

        public struct Request: Codable, Sendable, RequestBody {
            public var url: String?

            public init(url: String? = nil) {
                self.url = url
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                url = try container.decodeIfPresent(String.self, forKey: "url")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(url, forKey: "url")
            }
        }

        public struct Response: Codable, Sendable {
            public var body: String?
            public var httpStatusCode: Int?

            public init(body: String? = nil,
                        httpStatusCode: Int? = nil)
            {
                self.body = body
                self.httpStatusCode = httpStatusCode
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                body = try container.decodeIfPresent(String.self, forKey: "body")
                httpStatusCode = try container.decodeIfPresent(Int.self, forKey: "httpStatusCode")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(body, forKey: "body")
                try container.encodeIfPresent(httpStatusCode, forKey: "httpStatusCode")
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var event: Event?

        public init(event: Event? = nil) {
            self.event = event
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            event = try container.decodeIfPresent(Event.self, forKey: "event")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(event, forKey: "event")
        }

        public struct Event: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "webhookEvents" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }
    }
}
