import Bagbutik_Core
import Foundation

public struct SubscriptionGroupSubmissionResponse: Codable {
    public let data: SubscriptionGroupSubmission
    public let links: DocumentLinks

    public init(data: SubscriptionGroupSubmission,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
