import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # PATCH /v1/appEventScreenshots/{id}

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appEventScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppEventScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppEventScreenshotV1(id: String,
                                           requestBody: AppEventScreenshotUpdateRequest) -> Request<AppEventScreenshotResponse, ErrorResponse>
    {
        .init(path: "/v1/appEventScreenshots/\(id)", method: .patch, requestBody: requestBody)
    }
}
