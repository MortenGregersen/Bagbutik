import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v3/appPricePoints/{id}/relationships/equalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v3-appPricePoints-_id_-relationships-equalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listEqualizationIdsForAppPricePointsV3(id: String,
                                                       limit: Int? = nil) -> Request<AppPricePointV3EqualizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v3/appPricePoints/\(id)/relationships/equalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
