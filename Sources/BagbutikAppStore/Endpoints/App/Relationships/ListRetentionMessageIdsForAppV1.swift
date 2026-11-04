import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-retentionMessages>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listRetentionMessageIdsForAppV1(id: String,
                                                limit: Int? = nil) -> Request<AppRetentionMessagesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/retentionMessages",
            method: .get,
            parameters: .init(limit: limit))
    }
}
