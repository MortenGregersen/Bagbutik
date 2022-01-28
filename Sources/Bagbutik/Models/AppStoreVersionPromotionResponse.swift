import Foundation

public struct AppStoreVersionPromotionResponse: Codable {
    /// The resource data.
    public let data: AppStoreVersionPromotion
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreVersionPromotion, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
