import Bagbutik_Core

public extension Request {
    /**
     # Create an In-App Purchase
     Create an in-app purchase, including a consumable, non-consumable, or non-renewing subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_in-app_purchase>

     - Parameter requestBody: InAppPurchase representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseV2(requestBody: InAppPurchaseV2CreateRequest) -> Request<InAppPurchaseV2Response, ErrorResponse> {
        .init(path: "/v2/inAppPurchases", method: .post, requestBody: requestBody)
    }
}
