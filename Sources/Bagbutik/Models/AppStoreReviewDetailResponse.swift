import Foundation

public struct AppStoreReviewDetailResponse: Codable {
    public let data: AppStoreReviewDetail
    public let included: [AppStoreReviewAttachment]?
    public let links: DocumentLinks

    public init(data: AppStoreReviewDetail, included: [AppStoreReviewAttachment]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
