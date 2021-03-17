import Foundation

/// A response that contains a single App Store Review Details resource.
public struct AppStoreReviewDetailResponse: Codable {
    /// The resource data.
    public let data: AppStoreReviewDetail
    public let included: [AppStoreReviewAttachment]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreReviewDetail, included: [AppStoreReviewAttachment]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
