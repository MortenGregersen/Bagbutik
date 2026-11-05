import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-retentionMessages-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForRetentionMessageV1(id: String,
                                                    limit: Int? = nil) -> Request<RetentionMessageVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessages/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
