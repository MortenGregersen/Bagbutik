public extension Request {
    /**
      # Create an App Info Localization
      Add app-level localized information for a new locale.

      Use this endpoint to add localized app information for a new locale. Be sure to use  to add the same locale to the version as well.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_info_localization>

      - Parameter requestBody: AppInfoLocalization representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppInfoLocalizationV1(requestBody: AppInfoLocalizationCreateRequest) -> Request<AppInfoLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/appInfoLocalizations", method: .post, requestBody: requestBody)
    }
}
