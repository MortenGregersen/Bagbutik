import Foundation

public struct AppPriceTierResponse: Codable {
    public let data: AppPriceTier
    public let included: [AppPricePoint]?
    public let links: DocumentLinks

    public init(data: AppPriceTier, included: [AppPricePoint]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
