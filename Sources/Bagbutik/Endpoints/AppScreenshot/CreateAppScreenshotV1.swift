public extension Request {
    /**
      # Create an App Screenshot
      Add a new screenshot to a screenshot set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_screenshot>

      - Parameter requestBody: AppScreenshot representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppScreenshotV1(requestBody: AppScreenshotCreateRequest) -> Request<AppScreenshotResponse, ErrorResponse> {
        return .init(path: "/v1/appScreenshots", method: .post, requestBody: requestBody)
    }
}
