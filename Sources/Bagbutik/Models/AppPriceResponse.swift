import Foundation

public struct AppPriceResponse: Codable {
    public let data: AppPrice
    public let links: DocumentLinks

    public init(data: AppPrice, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
