import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Deactivate One-Time Use Offer Codes
     Deactivate a batch of one-time use offer codes for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionOfferCodeOneTimeUseCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionOfferCodeOneTimeUseCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionOfferCodeOneTimeUseCodeV1(id: String,
                                                            requestBody: SubscriptionOfferCodeOneTimeUseCodeUpdateRequest) -> Request<SubscriptionOfferCodeOneTimeUseCodeResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionOfferCodeOneTimeUseCodes/\(id)", method: .patch, requestBody: requestBody)
    }
}
