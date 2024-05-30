import Bagbutik_Core
import Foundation

public struct SubscriptionSubmissionResponse: Codable {
    public let data: SubscriptionSubmission
    public var included: [Subscription]?
    public let links: DocumentLinks

    public init(data: SubscriptionSubmission,
                included: [Subscription]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(SubscriptionSubmission.self, forKey: .data)
        included = try container.decodeIfPresent([Subscription].self, forKey: .included)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
    }
}
