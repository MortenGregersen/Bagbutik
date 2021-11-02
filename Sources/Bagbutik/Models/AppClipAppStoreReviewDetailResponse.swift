import Foundation

public struct AppClipAppStoreReviewDetailResponse: Codable {
    public let data: AppClipAppStoreReviewDetail
    public let included: [AppClipDefaultExperience]?
    public let links: DocumentLinks

    public init(data: AppClipAppStoreReviewDetail, included: [AppClipDefaultExperience]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
