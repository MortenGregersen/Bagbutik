import Foundation

public struct CustomerReviewResponseV1Response: Codable {
    public let data: CustomerReviewResponseV1
    public var included: [CustomerReview]?
    public let links: DocumentLinks

    public init(data: CustomerReviewResponseV1, included: [CustomerReview]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
