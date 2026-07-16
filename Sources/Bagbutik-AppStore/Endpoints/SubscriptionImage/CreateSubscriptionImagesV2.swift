import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a subscription image
     Reserve a promotion image for an auto-renewable subscription configured with the v2 API and prepare its asset upload.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-subscriptionImages>

     - Parameter requestBody: SubscriptionImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionImagesV2(requestBody: SubscriptionImageV2CreateRequest) -> Request<SubscriptionImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/subscriptionImages",
            method: .post,
            requestBody: requestBody)
    }
}
