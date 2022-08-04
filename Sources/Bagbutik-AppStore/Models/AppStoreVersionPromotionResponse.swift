import Foundation
import Bagbutik_Core

public struct AppStoreVersionPromotionResponse: Codable {
    public let data: AppStoreVersionPromotion
    public let links: DocumentLinks

    public init(data: AppStoreVersionPromotion,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
