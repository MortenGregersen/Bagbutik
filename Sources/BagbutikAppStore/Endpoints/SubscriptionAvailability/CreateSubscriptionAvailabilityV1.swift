import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify the territory availability of a subscription

     Update the territory availability of a specific subscription.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionAvailabilities>

     - Parameter requestBody: SubscriptionAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createSubscriptionAvailabilityV1(requestBody: SubscriptionAvailabilityCreateRequest) -> Request<SubscriptionAvailabilityResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionAvailabilities",
            method: .post,
            requestBody: requestBody)
    }
}
