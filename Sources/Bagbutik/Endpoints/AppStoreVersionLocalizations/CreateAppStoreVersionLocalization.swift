public extension Request {
    /**
      # Create an App Store Version Localization
      Add localized version-level information for a new locale.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_app_store_version_localization>

      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createAppStoreVersionLocalization(requestBody: AppStoreVersionLocalizationCreateRequest) -> Request<AppStoreVersionLocalizationResponse, ErrorResponse> {
        return .init(path: "/v1/appStoreVersionLocalizations", method: .post, requestBody: requestBody)
    }
}
