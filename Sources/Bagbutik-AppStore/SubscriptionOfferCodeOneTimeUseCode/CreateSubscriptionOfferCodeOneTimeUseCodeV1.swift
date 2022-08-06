import Bagbutik_Models

public extension Request {
    /**
     # Create One-Time Use Offer Codes
     Create one-time use codes for an auto-renewable subscription offer.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_one-time_use_offer_codes>

     - Parameter requestBody: SubscriptionOfferCodeOneTimeUseCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionOfferCodeOneTimeUseCodeV1(requestBody: SubscriptionOfferCodeOneTimeUseCodeCreateRequest) -> Request<SubscriptionOfferCodeOneTimeUseCodeResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionOfferCodeOneTimeUseCodes", method: .post, requestBody: requestBody)
    }
}
