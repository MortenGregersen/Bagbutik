import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an App Screenshot
     Add a new screenshot to a screenshot set.

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
