import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Review Submission for a Subscription
     Create a review submission for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionSubmissions>

     - Parameter requestBody: SubscriptionSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionSubmissionV1(requestBody: SubscriptionSubmissionCreateRequest) -> Request<SubscriptionSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionSubmissions",
            method: .post,
            requestBody: requestBody)
    }
}
