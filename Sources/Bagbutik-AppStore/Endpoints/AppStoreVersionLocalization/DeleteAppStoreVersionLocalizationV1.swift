import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Store Version Localization
     Delete a language from your version metadata.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appStoreVersionLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppStoreVersionLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionLocalizations/\(id)",
            method: .delete)
    }
}
