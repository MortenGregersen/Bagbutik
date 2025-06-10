import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Deactivate a Subscription Offer with Offer Codes
     Deactivate a subscription offer that has offer codes for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionOfferCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionOfferCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionOfferCodeV1(id: String,
                                              requestBody: SubscriptionOfferCodeUpdateRequest) -> Request<SubscriptionOfferCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodes/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
