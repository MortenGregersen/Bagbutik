public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appeventvideoclips>

      - Parameter requestBody: AppEventVideoClip representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppEventVideoClip(requestBody: AppEventVideoClipCreateRequest) -> Request<AppEventVideoClipResponse, ErrorResponse> {
        return .init(path: "/v1/appEventVideoClips", method: .post, requestBody: requestBody)
    }
}
