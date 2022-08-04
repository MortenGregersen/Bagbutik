import Foundation

public struct PromotedPurchaseImageResponse: Codable {
    public let data: PromotedPurchaseImage
    public var included: [PromotedPurchase]?
    public let links: DocumentLinks

    public init(data: PromotedPurchaseImage,
                included: [PromotedPurchase]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
