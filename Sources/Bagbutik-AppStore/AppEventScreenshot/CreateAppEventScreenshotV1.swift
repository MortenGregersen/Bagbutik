import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/appEventScreenshots

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-appEventScreenshots>

     - Parameter requestBody: AppEventScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppEventScreenshotV1(requestBody: AppEventScreenshotCreateRequest) -> Request<AppEventScreenshotResponse, ErrorResponse> {
        .init(path: "/v1/appEventScreenshots", method: .post, requestBody: requestBody)
    }
}
