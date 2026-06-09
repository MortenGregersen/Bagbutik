import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Update an app event screenshot

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appEventScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppEventScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateAppEventScreenshotV1(id: String,
                                           requestBody: AppEventScreenshotUpdateRequest) -> Request<AppEventScreenshotResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventScreenshots/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
