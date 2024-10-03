import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Promoted In-App Purchase
     Update the visibility of a promoted in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-promotedPurchases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: PromotedPurchase representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updatePromotedPurchaseV1(id: String,
                                         requestBody: PromotedPurchaseUpdateRequest) -> Request<PromotedPurchaseResponse, ErrorResponse>
    {
        .init(path: "/v1/promotedPurchases/\(id)", method: .patch, requestBody: requestBody)
    }
}
