import Foundation

public struct BetaAppReviewDetailResponse: Codable {
    public let data: BetaAppReviewDetail
    public let included: [App]?
    public let links: DocumentLinks

    public init(data: BetaAppReviewDetail, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
