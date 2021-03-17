import Foundation

/// A response that contains a single Beta App Review Submissions resource.
public struct BetaAppReviewSubmissionResponse: Codable {
    /// The resource data.
    public let data: BetaAppReviewSubmission
    public let included: [Build]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaAppReviewSubmission, included: [Build]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
