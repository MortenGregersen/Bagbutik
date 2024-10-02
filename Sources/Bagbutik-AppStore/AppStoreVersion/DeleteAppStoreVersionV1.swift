import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Store Version
     Delete an app store version that is associated with an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appStoreVersions-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppStoreVersionV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appStoreVersions/\(id)", method: .delete)
    }
}
