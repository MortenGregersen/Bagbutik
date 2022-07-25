public extension Request {
    /**
      # Get All App Screenshot IDs for an App Screenshot Set
      Get the ordered screenshot IDs in a screenshot set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_all_app_screenshot_ids_for_an_app_screenshot_set>

      - Parameter id: The id of the requested resource
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppScreenshotIdsForAppScreenshotSetV1(id: String,
                                                          limit: Int? = nil) -> Request<AppScreenshotSetAppScreenshotsLinkagesResponse, ErrorResponse>
    {
        return .init(path: "/v1/appScreenshotSets/\(id)/relationships/appScreenshots", method: .get, parameters: .init(limit: limit))
    }
}
