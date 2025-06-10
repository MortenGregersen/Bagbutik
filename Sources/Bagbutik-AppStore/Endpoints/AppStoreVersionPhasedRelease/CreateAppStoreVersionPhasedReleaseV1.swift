import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an App Store Version Phased Release
     Enable phased release for an App Store version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appStoreVersionPhasedReleases>

     - Parameter requestBody: AppStoreVersionPhasedRelease representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppStoreVersionPhasedReleaseV1(requestBody: AppStoreVersionPhasedReleaseCreateRequest) -> Request<AppStoreVersionPhasedReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersionPhasedReleases",
            method: .post,
            requestBody: requestBody)
    }
}
