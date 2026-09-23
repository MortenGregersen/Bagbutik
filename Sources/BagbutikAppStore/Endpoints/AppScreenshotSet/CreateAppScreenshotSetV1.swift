import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an app screenshot set

     Add a new screenshot set to an App Store version localization for a specific screenshot type and display size.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appScreenshotSets>

     - Parameter requestBody: AppScreenshotSet representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppScreenshotSetV1(requestBody: AppScreenshotSetCreateRequest) -> Request<AppScreenshotSetResponse, ErrorResponse> {
        .init(
            path: "/v1/appScreenshotSets",
            method: .post,
            requestBody: requestBody)
    }
}
