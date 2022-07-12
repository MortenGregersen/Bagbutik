public extension Request {
    /**
      # Create an App Info Localization
      Add app-level localized information for a new locale.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_info_localization>

      - Parameter requestBody: AppInfoLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppInfoLocalizationV1(requestBody: AppInfoLocalizationCreateRequest) -> Request<AppInfoLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/appInfoLocalizations", method: .post, requestBody: requestBody)
    }
}
