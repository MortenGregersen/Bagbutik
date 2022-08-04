import Foundation
import Bagbutik_Core

public struct InAppPurchaseAppStoreReviewScreenshotResponse: Codable {
    public let data: InAppPurchaseAppStoreReviewScreenshot
    public var included: [InAppPurchaseV2]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseAppStoreReviewScreenshot,
                included: [InAppPurchaseV2]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
