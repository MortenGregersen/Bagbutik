import Bagbutik_Core
import Foundation

public struct InAppPurchaseAvailabilityResponse: Codable {
    public let data: InAppPurchaseAvailability
    public var included: [Territory]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseAvailability,
                included: [Territory]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
