import Foundation

public struct SubscriptionGracePeriodResponse: Codable {
    public let data: SubscriptionGracePeriod
    public let links: DocumentLinks

    public init(data: SubscriptionGracePeriod,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
