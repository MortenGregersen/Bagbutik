import Foundation

public struct InAppPurchaseContentResponse: Codable {
    public let data: InAppPurchaseContent
    public var included: [InAppPurchaseV2]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseContent, included: [InAppPurchaseV2]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
