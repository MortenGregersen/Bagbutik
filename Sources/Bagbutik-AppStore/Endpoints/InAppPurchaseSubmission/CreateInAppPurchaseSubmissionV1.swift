import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Review Submission for an In-App Purchase
     Create an in-app purchase submission for review.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseSubmissions>

     - Parameter requestBody: InAppPurchaseSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseSubmissionV1(requestBody: InAppPurchaseSubmissionCreateRequest) -> Request<InAppPurchaseSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseSubmissions",
            method: .post,
            requestBody: requestBody)
    }
}
