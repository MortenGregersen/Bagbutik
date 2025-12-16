import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an in-app purchase offer code
     Update a specific in-app purchase offer code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-inAppPurchaseOfferCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseOfferCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseOfferCodeV1(id: String,
                                               requestBody: InAppPurchaseOfferCodeUpdateRequest) -> Request<InAppPurchaseOfferCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodes/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
