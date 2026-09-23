import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app screenshot

     Add a new screenshot to a screenshot set.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appScreenshots>

     - Parameter requestBody: AppScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppScreenshotV1(requestBody: AppScreenshotCreateRequest) -> Request<AppScreenshotResponse, ErrorResponse> {
        .init(
            path: "/v1/appScreenshots",
            method: .post,
            requestBody: requestBody)
    }
}
