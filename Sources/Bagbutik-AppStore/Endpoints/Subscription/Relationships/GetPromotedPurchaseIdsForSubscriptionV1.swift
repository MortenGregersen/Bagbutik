import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptions/{id}/relationships/promotedPurchase

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-promotedPurchase>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPromotedPurchaseIdsForSubscriptionV1(id: String) -> Request<SubscriptionPromotedPurchaseLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/promotedPurchase",
            method: .get)
    }
}
