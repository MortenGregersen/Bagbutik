import Bagbutik_Core
import Foundation

public struct SubscriptionGracePeriodUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "subscriptionGracePeriods" }
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
            public var duration: SubscriptionGracePeriodDuration?
            public var optIn: Bool?
            public var renewalType: SubscriptionGracePeriod.Attributes.RenewalType?
            public var sandboxOptIn: Bool?

            public init(duration: SubscriptionGracePeriodDuration? = nil,
                        optIn: Bool? = nil,
                        renewalType: SubscriptionGracePeriod.Attributes.RenewalType? = nil,
                        sandboxOptIn: Bool? = nil)
            {
                self.duration = duration
                self.optIn = optIn
                self.renewalType = renewalType
                self.sandboxOptIn = sandboxOptIn
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                duration = try container.decodeIfPresent(SubscriptionGracePeriodDuration.self, forKey: "duration")
                optIn = try container.decodeIfPresent(Bool.self, forKey: "optIn")
                renewalType = try container.decodeIfPresent(SubscriptionGracePeriod.Attributes.RenewalType.self, forKey: "renewalType")
                sandboxOptIn = try container.decodeIfPresent(Bool.self, forKey: "sandboxOptIn")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(duration, forKey: "duration")
                try container.encodeIfPresent(optIn, forKey: "optIn")
                try container.encodeIfPresent(renewalType, forKey: "renewalType")
                try container.encodeIfPresent(sandboxOptIn, forKey: "sandboxOptIn")
            }
        }
    }
}
