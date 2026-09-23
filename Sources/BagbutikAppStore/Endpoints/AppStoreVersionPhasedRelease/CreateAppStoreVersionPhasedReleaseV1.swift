import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app store version phased release

     Enable phased release for an App Store version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
