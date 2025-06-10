import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Bundle ID
     You can only delete bundle IDs that are used for development. You can’t delete bundle IDs that are being used by an app in App Store Connect.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-bundleIds-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBundleIdV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIds/\(id)",
            method: .delete)
    }
}
