import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an App Screenshot
     Commit an app screenshot after uploading it.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-appScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: AppScreenshot representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppScreenshotV1(id: String,
                                      requestBody: AppScreenshotUpdateRequest) -> Request<AppScreenshotResponse, ErrorResponse>
    {
        .init(path: "/v1/appScreenshots/\(id)", method: .patch, requestBody: requestBody)
    }
}
