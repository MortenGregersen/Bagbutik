import Foundation

/**
 A response that contains a single App Clip App Store Review Details resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipappstorereviewdetailresponse>
 */
public struct AppClipAppStoreReviewDetailResponse: Codable {
    /// The resource data.
    public let data: AppClipAppStoreReviewDetail
    /// The included related resources.
    public let included: [AppClipDefaultExperience]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppClipAppStoreReviewDetail, included: [AppClipDefaultExperience]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
