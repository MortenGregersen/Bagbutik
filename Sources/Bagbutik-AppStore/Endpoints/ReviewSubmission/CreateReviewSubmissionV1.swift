import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a review submission
     Create a review submission for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-reviewSubmissions>

     - Parameter requestBody: ReviewSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createReviewSubmissionV1(requestBody: ReviewSubmissionCreateRequest) -> Request<ReviewSubmissionResponse, ErrorResponse> {
        .init(path: "/v1/reviewSubmissions", method: .post, requestBody: requestBody)
    }
}
