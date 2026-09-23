import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an app store version

     Update the App Store version for a specific app.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appStoreVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppStoreVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppStoreVersionV1(id: String,
                                        requestBody: AppStoreVersionUpdateRequest) -> Request<AppStoreVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
