public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/post_v1_appcustomproductpagelocalizations>

      - Parameter requestBody: AppCustomProductPageLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppCustomProductPageLocalization(requestBody: AppCustomProductPageLocalizationCreateRequest) -> Request<AppCustomProductPageLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/appCustomProductPageLocalizations", method: .post, requestBody: requestBody)
    }
}
