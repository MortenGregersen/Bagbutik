import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Profile
     Delete a provisioning profile that is used for app development or distribution.

     You can delete provisioning profiles, and may wish to do so if they are expiring or obsolete.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-profiles-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteProfileV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/profiles/\(id)",
            method: .delete)
    }
}
