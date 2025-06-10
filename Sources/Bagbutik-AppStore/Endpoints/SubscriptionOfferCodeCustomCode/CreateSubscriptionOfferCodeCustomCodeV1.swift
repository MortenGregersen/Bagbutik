import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create Custom Offer Codes
     Create custom offer codes for an auto-renewable subscription offer.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionOfferCodeCustomCodes>

     - Parameter requestBody: SubscriptionOfferCodeCustomCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionOfferCodeCustomCodeV1(requestBody: SubscriptionOfferCodeCustomCodeCreateRequest) -> Request<SubscriptionOfferCodeCustomCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodeCustomCodes",
            method: .post,
            requestBody: requestBody)
    }
}
