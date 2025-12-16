import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an in-app purchase offer code custom code
     Update a specific in-app purchase offer code custom code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-inAppPurchaseOfferCodeCustomCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseOfferCodeCustomCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseOfferCodeCustomCodeV1(id: String,
                                                         requestBody: InAppPurchaseOfferCodeCustomCodeUpdateRequest) -> Request<InAppPurchaseOfferCodeCustomCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeCustomCodes/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
