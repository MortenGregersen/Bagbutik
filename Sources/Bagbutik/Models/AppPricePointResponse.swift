import Foundation

/// A response that contains a single App Price Points resource.
public struct AppPricePointResponse: Codable {
    /// The resource data.
    public let data: AppPricePoint
    public let included: [Territory]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPricePoint, included: [Territory]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
