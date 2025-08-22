import Bagbutik_Core
import Foundation

public struct SubscriptionGracePeriod: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "subscriptionGracePeriods" }
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
        public var duration: SubscriptionGracePeriodDuration?
        public var optIn: Bool?
        public var renewalType: RenewalType?
        public var sandboxOptIn: Bool?

        public init(duration: SubscriptionGracePeriodDuration? = nil,
                    optIn: Bool? = nil,
                    renewalType: RenewalType? = nil,
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
            renewalType = try container.decodeIfPresent(RenewalType.self, forKey: "renewalType")
            sandboxOptIn = try container.decodeIfPresent(Bool.self, forKey: "sandboxOptIn")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(duration, forKey: "duration")
            try container.encodeIfPresent(optIn, forKey: "optIn")
            try container.encodeIfPresent(renewalType, forKey: "renewalType")
            try container.encodeIfPresent(sandboxOptIn, forKey: "sandboxOptIn")
        }

        public enum RenewalType: String, Sendable, Codable, CaseIterable {
            case allRenewals = "ALL_RENEWALS"
            case paidToPaidOnly = "PAID_TO_PAID_ONLY"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = RenewalType(rawValue: string) {
                    self = value
                } else if let value = RenewalType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid RenewalType value: \(string)"
                    )
                }
            }
        }
    }
}
