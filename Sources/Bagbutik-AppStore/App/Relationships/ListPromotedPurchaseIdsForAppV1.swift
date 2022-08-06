import Bagbutik_Models

public extension Request {
    /**
     # List Promoted Purchase IDs for an App
     Get a list of resource IDs representing promoted purchases for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_promoted_purchase_ids_for_an_app>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPromotedPurchaseIdsForAppV1(id: String,
                                                limit: Int? = nil) -> Request<AppPromotedPurchasesLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/relationships/promotedPurchases", method: .get, parameters: .init(limit: limit))
    }
}
