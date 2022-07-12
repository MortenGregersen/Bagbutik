public extension Request {
    /**
      # Create an App Screenshot Set
      Add a new screenshot set to an App Store version localization for a specific screenshot type and display size.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_screenshot_set>

      - Parameter requestBody: AppScreenshotSet representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppScreenshotSetV1(requestBody: AppScreenshotSetCreateRequest) -> Request<AppScreenshotSetResponse, ErrorResponse> {
        return .init(path: "/v1/appScreenshotSets", method: .post, requestBody: requestBody)
    }
}
