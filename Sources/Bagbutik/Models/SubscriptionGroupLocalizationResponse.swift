import Foundation

public struct SubscriptionGroupLocalizationResponse: Codable {
    public let data: SubscriptionGroupLocalization
    public var included: [SubscriptionGroup]?
    public let links: DocumentLinks

    public init(data: SubscriptionGroupLocalization, included: [SubscriptionGroup]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
