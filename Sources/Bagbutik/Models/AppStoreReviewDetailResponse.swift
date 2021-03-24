import Foundation

/**
 A response that contains a single App Store Review Details resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstorereviewdetailresponse>
 */
public struct AppStoreReviewDetailResponse: Codable {
    /// The resource data.
    public let data: AppStoreReviewDetail
    /// The included related resources.
    public let included: [AppStoreReviewAttachment]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppStoreReviewDetail, included: [AppStoreReviewAttachment]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
