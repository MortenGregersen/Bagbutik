public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appeventlocalizations>

      - Parameter requestBody: AppEventLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppEventLocalizationV1(requestBody: AppEventLocalizationCreateRequest) -> Request<AppEventLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/appEventLocalizations", method: .post, requestBody: requestBody)
    }
}
