import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Submit an App for Beta Review
     Submit an app for beta app review to allow external testing.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-betaAppReviewSubmissions>

     - Parameter requestBody: BetaAppReviewSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaAppReviewSubmissionV1(requestBody: BetaAppReviewSubmissionCreateRequest) -> Request<BetaAppReviewSubmissionResponse, ErrorResponse> {
        .init(path: "/v1/betaAppReviewSubmissions", method: .post, requestBody: requestBody)
    }
}
