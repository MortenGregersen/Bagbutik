import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Store Version Phased Release
     Cancel a planned phased release that has not been started.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-appStoreVersionPhasedReleases-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppStoreVersionPhasedReleaseV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionPhasedReleases/\(id)",
            method: .delete)
    }
}
