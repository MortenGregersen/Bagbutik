public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appevents>

      - Parameter requestBody: AppEvent representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppEventV1(requestBody: AppEventCreateRequest) -> Request<AppEventResponse, ErrorResponse> {
        return .init(path: "/v1/appEvents", method: .post, requestBody: requestBody)
    }
}
