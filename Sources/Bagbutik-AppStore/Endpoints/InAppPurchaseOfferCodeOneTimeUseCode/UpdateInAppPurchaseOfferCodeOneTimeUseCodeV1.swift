import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an in-app purchase offer code one-time use code
     Update a specific in-app purchase offer code one-time use code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-inAppPurchaseOfferCodeOneTimeUseCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseOfferCodeOneTimeUseCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseOfferCodeOneTimeUseCodeV1(id: String,
                                                             requestBody: InAppPurchaseOfferCodeOneTimeUseCodeUpdateRequest) -> Request<InAppPurchaseOfferCodeOneTimeUseCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeOneTimeUseCodes/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
