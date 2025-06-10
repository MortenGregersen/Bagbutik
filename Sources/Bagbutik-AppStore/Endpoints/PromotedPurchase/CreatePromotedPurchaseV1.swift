import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Promote a Purchase
     Add an existing in-app purchase or auto-renewable subscription to the promoted in-app purchases on an app listing in the App Store.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-promotedPurchases>

     - Parameter requestBody: PromotedPurchase representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createPromotedPurchaseV1(requestBody: PromotedPurchaseCreateRequest) -> Request<PromotedPurchaseResponse, ErrorResponse> {
        .init(
            path: "/v1/promotedPurchases",
            method: .post,
            requestBody: requestBody)
    }
}
