import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an in-app purchase offer code
     Create an offer code for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseOfferCodes>

     - Parameter requestBody: InAppPurchaseOfferCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseOfferCodeV1(requestBody: InAppPurchaseOfferCodeCreateRequest) -> Request<InAppPurchaseOfferCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodes",
            method: .post,
            requestBody: requestBody)
    }
}
