import Foundation

public struct AppPricePointResponse: Codable {
    public let data: AppPricePoint
    public let included: [Territory]?
    public let links: DocumentLinks

    public init(data: AppPricePoint, included: [Territory]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
