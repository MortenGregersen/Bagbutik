import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Remove a Promoted Purchase
     Remove a promotion for an in-app purchase or auto-renewable subscription from the App Store listing.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-promotedPurchases-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deletePromotedPurchaseV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/promotedPurchases/\(id)", method: .delete)
    }
}
