import Foundation

public struct AppPreOrderResponse: Codable {
    public let data: AppPreOrder
    public let links: DocumentLinks

    public init(data: AppPreOrder, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
