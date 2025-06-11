import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/apps/{id}/relationships/marketplaceSearchDetail

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-marketplaceSearchDetail>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMarketplaceSearchDetailIdsForAppV1(id: String) -> Request<AppMarketplaceSearchDetailLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/marketplaceSearchDetail",
            method: .get)
    }
}
