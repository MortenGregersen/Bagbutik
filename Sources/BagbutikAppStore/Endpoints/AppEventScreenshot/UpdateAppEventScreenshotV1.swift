import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Update an app event screenshot

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appEventScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppEventScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppEventScreenshotV1(id: String,
                                           requestBody: AppEventScreenshotUpdateRequest) -> Request<AppEventScreenshotResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventScreenshots/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
