import Bagbutik_Models

public extension Request {
    /**
     # Submit an App for Beta Review
     Submit an app for beta app review to allow external testing.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/submit_an_app_for_beta_review>

     - Parameter requestBody: BetaAppReviewSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createBetaAppReviewSubmissionV1(requestBody: BetaAppReviewSubmissionCreateRequest) -> Request<BetaAppReviewSubmissionResponse, ErrorResponse> {
        .init(path: "/v1/betaAppReviewSubmissions", method: .post, requestBody: requestBody)
    }
}
