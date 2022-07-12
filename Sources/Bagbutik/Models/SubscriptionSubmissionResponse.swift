import Foundation

public struct SubscriptionSubmissionResponse: Codable {
    public let data: SubscriptionSubmission
    public var included: [Subscription]?
    public let links: DocumentLinks

    public init(data: SubscriptionSubmission, included: [Subscription]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
