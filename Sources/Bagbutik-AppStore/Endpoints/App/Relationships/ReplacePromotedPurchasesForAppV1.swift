import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the Order of a Promoted Purchase for an App
     Update the order of promoted purchases.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-apps-_id_-relationships-promotedPurchases>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replacePromotedPurchasesForAppV1(id: String,
                                                 requestBody: AppPromotedPurchasesLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/promotedPurchases",
            method: .patch,
            requestBody: requestBody)
    }
}
