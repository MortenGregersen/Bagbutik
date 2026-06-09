import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an app screenshot set
     Add a new screenshot set to an App Store version localization for a specific screenshot type and display size.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appScreenshotSets>

     - Parameter requestBody: AppScreenshotSet representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createAppScreenshotSetV1(requestBody: AppScreenshotSetCreateRequest) -> Request<AppScreenshotSetResponse, ErrorResponse> {
        .init(
            path: "/v1/appScreenshotSets",
            method: .post,
            requestBody: requestBody)
    }
}
