import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**


     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-retentionMessageLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteRetentionMessageLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/retentionMessageLocalizations/\(id)",
            method: .delete)
    }
}
