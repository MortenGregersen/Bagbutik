import Foundation
import Bagbutik_Core

public struct SubscriptionLocalizationResponse: Codable {
    public let data: SubscriptionLocalization
    public var included: [Subscription]?
    public let links: DocumentLinks

    public init(data: SubscriptionLocalization,
                included: [Subscription]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
