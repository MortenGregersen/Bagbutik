import Bagbutik_Core
import Foundation

/**
 # BetaAppReviewSubmissionResponse
 A response that contains a single Beta App Review Submissions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewsubmissionresponse>
 */
public struct BetaAppReviewSubmissionResponse: Codable {
    /// The resource data.
    public let data: BetaAppReviewSubmission
    public var included: [Build]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaAppReviewSubmission,
                included: [Build]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
