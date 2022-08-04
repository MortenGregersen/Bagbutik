import Foundation
import Bagbutik_Core

public struct SubscriptionAppStoreReviewScreenshotResponse: Codable {
    public let data: SubscriptionAppStoreReviewScreenshot
    public var included: [Subscription]?
    public let links: DocumentLinks

    public init(data: SubscriptionAppStoreReviewScreenshot,
                included: [Subscription]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
