import Foundation

public struct CustomerReviewResponse: Codable {
    public let data: CustomerReview
    public var included: [CustomerReviewResponseV1]?
    public let links: DocumentLinks

    public init(data: CustomerReview, included: [CustomerReviewResponseV1]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
