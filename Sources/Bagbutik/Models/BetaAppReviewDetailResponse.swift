import Foundation

/**
 A response that contains a single Beta App Review Details resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetailresponse>
 */
public struct BetaAppReviewDetailResponse: Codable {
    /// The resource data.
    public let data: BetaAppReviewDetail
    public let included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaAppReviewDetail, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
