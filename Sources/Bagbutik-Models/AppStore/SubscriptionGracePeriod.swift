import Bagbutik_Core
import Foundation

public struct SubscriptionGracePeriod: Codable, Identifiable {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    public struct Attributes: Codable {
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

        public enum RenewalType: String, Codable, CaseIterable {
            case allRenewals = "ALL_RENEWALS"
            case paidToPaidOnly = "PAID_TO_PAID_ONLY"
        }
    }
}
