import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an app screenshot

     Commit an app screenshot after uploading it.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppScreenshotV1(id: String,
                                      requestBody: AppScreenshotUpdateRequest) -> Request<AppScreenshotResponse, ErrorResponse> {
        .init(
            path: "/v1/appScreenshots/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
