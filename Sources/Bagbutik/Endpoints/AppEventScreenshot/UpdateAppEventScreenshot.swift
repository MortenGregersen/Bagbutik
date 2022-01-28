public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/patch_v1_appeventscreenshots_id>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppEventScreenshot representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppEventScreenshot(id: String,
                                         requestBody: AppEventScreenshotUpdateRequest) -> Request<AppEventScreenshotResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEventScreenshots/\(id)", method: .patch, requestBody: requestBody)
    }
}
