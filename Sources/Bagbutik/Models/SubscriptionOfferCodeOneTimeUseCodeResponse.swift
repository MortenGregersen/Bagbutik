import Foundation

public struct SubscriptionOfferCodeOneTimeUseCodeResponse: Codable {
    public let data: SubscriptionOfferCodeOneTimeUseCode
    public var included: [SubscriptionOfferCode]?
    public let links: DocumentLinks

    public init(data: SubscriptionOfferCodeOneTimeUseCode, included: [SubscriptionOfferCode]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
