import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionGroupSubmissionResponse
 A response confirming the submission of a subscription group for App Store review.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptiongroupsubmissionresponse>
 */
public struct SubscriptionGroupSubmissionResponse: Codable, Sendable {
    public let data: SubscriptionGroupSubmission
    public let links: DocumentLinks

    public init(data: SubscriptionGroupSubmission,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionGroupSubmission.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
