import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an in-app purchase offer code one-time use code
     Create a one-time use code for an in-app purchase offer code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseOfferCodeOneTimeUseCodes>

     - Parameter requestBody: InAppPurchaseOfferCodeOneTimeUseCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseOfferCodeOneTimeUseCodeV1(requestBody: InAppPurchaseOfferCodeOneTimeUseCodeCreateRequest) -> Request<InAppPurchaseOfferCodeOneTimeUseCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeOneTimeUseCodes",
            method: .post,
            requestBody: requestBody)
    }
}
