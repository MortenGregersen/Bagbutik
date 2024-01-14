import Bagbutik_Core
import Foundation

public struct BetaAppReviewSubmissionWithoutIncludesResponse: Codable {
    public let data: BetaAppReviewSubmission
    public let links: DocumentLinks

    public init(data: BetaAppReviewSubmission,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
