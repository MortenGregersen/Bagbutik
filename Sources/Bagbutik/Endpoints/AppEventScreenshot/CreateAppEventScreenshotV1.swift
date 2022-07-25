public extension Request {
    /**
      # POST /v1/appEventScreenshots

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appeventscreenshots>

      - Parameter requestBody: AppEventScreenshot representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createAppEventScreenshotV1(requestBody: AppEventScreenshotCreateRequest) -> Request<AppEventScreenshotResponse, ErrorResponse> {
        return .init(path: "/v1/appEventScreenshots", method: .post, requestBody: requestBody)
    }
}
