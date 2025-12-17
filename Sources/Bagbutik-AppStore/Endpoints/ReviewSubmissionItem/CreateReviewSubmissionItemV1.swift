import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a review submission item
     Create a new review submission item.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-reviewSubmissionItems>

     - Parameter requestBody: ReviewSubmissionItem representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createReviewSubmissionItemV1(requestBody: ReviewSubmissionItemCreateRequest) -> Request<ReviewSubmissionItemResponse, ErrorResponse> {
        .init(
            path: "/v1/reviewSubmissionItems",
            method: .post,
            requestBody: requestBody)
    }
}
