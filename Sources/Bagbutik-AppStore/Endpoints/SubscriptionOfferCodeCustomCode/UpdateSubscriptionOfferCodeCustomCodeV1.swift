import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Deactivate Custom Offer Codes
     Deactivate a batch of custom offer codes for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionOfferCodeCustomCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionOfferCodeCustomCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionOfferCodeCustomCodeV1(id: String,
                                                        requestBody: SubscriptionOfferCodeCustomCodeUpdateRequest) -> Request<SubscriptionOfferCodeCustomCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodeCustomCodes/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
