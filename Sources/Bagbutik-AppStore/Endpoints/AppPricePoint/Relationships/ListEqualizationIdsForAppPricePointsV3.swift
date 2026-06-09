import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List equalization price point IDs for an app price point
     Get a list of equalization price point IDs for a specific app price point.

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
