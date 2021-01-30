public extension Request {
    /**
      # Replace All App Screenshots for an App Screenshot Set
      Change the order of the screenshots in a screenshot set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/replace_all_app_screenshots_for_an_app_screenshot_set>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func replaceAppScreenshotsForAppScreenshotSet(id: String,
                                                         requestBody: AppScreenshotSetAppScreenshotsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/appScreenshotSets/\(id)/relationships/appScreenshots", method: .patch, requestBody: requestBody)
    }
}
