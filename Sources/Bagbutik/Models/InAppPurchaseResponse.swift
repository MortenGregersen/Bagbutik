import Foundation

public struct InAppPurchaseResponse: Codable {
    public let data: InAppPurchase
    public let links: DocumentLinks

    public init(data: InAppPurchase, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
