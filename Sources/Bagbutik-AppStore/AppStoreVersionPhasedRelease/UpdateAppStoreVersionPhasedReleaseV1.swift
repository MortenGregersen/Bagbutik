import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Store Version Phased Release
     Pause or resume a phased release, or immediately release an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appStoreVersionPhasedReleases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreVersionPhasedRelease representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreVersionPhasedReleaseV1(id: String,
                                                     requestBody: AppStoreVersionPhasedReleaseUpdateRequest) -> Request<AppStoreVersionPhasedReleaseResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersionPhasedReleases/\(id)", method: .patch, requestBody: requestBody)
    }
}
