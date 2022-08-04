import Bagbutik_Core

public extension Request {
    /**
     # Delete an App Screenshot Set
     Delete an app screenshot set and all of its screenshots.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_app_screenshot_set>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppScreenshotSetV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appScreenshotSets/\(id)", method: .delete)
    }
}
