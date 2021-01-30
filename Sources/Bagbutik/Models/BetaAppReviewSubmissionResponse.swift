import Foundation

public struct BetaAppReviewSubmissionResponse: Codable {
    public let data: BetaAppReviewSubmission
    public let included: [Build]?
    public let links: DocumentLinks

    public init(data: BetaAppReviewSubmission, included: [Build]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
