import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Replace All App Screenshots for an App Screenshot Set
     Change the order of the screenshots in a screenshot set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/replace_all_app_screenshots_for_an_app_screenshot_set>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceAppScreenshotsForAppScreenshotSetV1(id: String,
                                                           requestBody: AppScreenshotSetAppScreenshotsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        .init(path: "/v1/appScreenshotSets/\(id)/relationships/appScreenshots", method: .patch, requestBody: requestBody)
    }
}
