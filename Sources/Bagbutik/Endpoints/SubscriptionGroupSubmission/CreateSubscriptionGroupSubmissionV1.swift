public extension Request {
    /**
     # Create a Review Submission for a Subscription Group
     Create a subscription group submission for review.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_review_submission_for_a_subscription_group>

     - Parameter requestBody: SubscriptionGroupSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionGroupSubmissionV1(requestBody: SubscriptionGroupSubmissionCreateRequest) -> Request<SubscriptionGroupSubmissionResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionGroupSubmissions", method: .post, requestBody: requestBody)
    }
}
