import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-retentionMessages-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteRetentionMessageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessages/\(id)",
            method: .delete)
    }
}
