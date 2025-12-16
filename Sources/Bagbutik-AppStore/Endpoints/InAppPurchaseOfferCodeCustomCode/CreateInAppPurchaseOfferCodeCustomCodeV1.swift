import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an in-app purchase offer code custom code
     Create a custom code for an in-app purchase offer code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseOfferCodeCustomCodes>

     - Parameter requestBody: InAppPurchaseOfferCodeCustomCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseOfferCodeCustomCodeV1(requestBody: InAppPurchaseOfferCodeCustomCodeCreateRequest) -> Request<InAppPurchaseOfferCodeCustomCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeCustomCodes",
            method: .post,
            requestBody: requestBody)
    }
}
