import Bagbutik_Core
import Foundation

public struct SubscriptionPricePointResponse: Codable {
    public let data: SubscriptionPricePoint
    public var included: [Territory]?
    public let links: DocumentLinks

    public init(data: SubscriptionPricePoint,
                included: [Territory]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
