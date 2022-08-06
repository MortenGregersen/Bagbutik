import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an App Screenshot
     Delete an app screenshot that is associated with a screenshot set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_screenshot>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppScreenshotV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appScreenshots/\(id)", method: .delete)
    }
}
