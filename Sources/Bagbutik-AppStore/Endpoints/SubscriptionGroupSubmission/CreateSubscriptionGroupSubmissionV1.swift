import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Review Submission for a Subscription Group
     Create a subscription group submission for review.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionGroupSubmissions>

     - Parameter requestBody: SubscriptionGroupSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionGroupSubmissionV1(requestBody: SubscriptionGroupSubmissionCreateRequest) -> Request<SubscriptionGroupSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroupSubmissions",
            method: .post,
            requestBody: requestBody)
    }
}
