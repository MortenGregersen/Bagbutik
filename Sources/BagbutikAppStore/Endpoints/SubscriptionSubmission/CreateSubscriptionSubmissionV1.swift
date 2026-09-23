import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a review submission for a subscription

     Create a review submission for an auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
