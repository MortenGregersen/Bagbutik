import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List equalization IDs for a subscription price point

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionPricePoints-_id_-relationships-equalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 8000
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listEqualizationIdsForSubscriptionPricePointV1(id: String,
                                                               limit: Int? = nil) -> Request<SubscriptionPricePointEqualizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPricePoints/\(id)/relationships/equalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
