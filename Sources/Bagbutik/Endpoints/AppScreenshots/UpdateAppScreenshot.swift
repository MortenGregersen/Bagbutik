public extension Request {
    /**
      # Modify an App Screenshot
      Commit an app screenshot after uploading it.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_screenshot>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppScreenshot(id: String,
                                    requestBody: AppScreenshotUpdateRequest) -> Request<AppScreenshotResponse, ErrorResponse>
    {
        return .init(path: "/v1/appScreenshots/\(id)", method: .patch, requestBody: requestBody)
    }
}
