import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Get the build id for an app store version

     Get the ID of the build that is attached to a specific App Store version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-relationships-build>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBuildIdsForAppStoreVersionV1(id: String) -> Request<AppStoreVersionBuildLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/relationships/build",
            method: .get)
    }
}
