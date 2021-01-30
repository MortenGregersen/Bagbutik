public extension Request {
    /**
      # Modify an App Store Version Localization
      Modify localized version-level information for a particular language.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_store_version_localization>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppStoreVersionLocalization(id: String,
                                                  requestBody: AppStoreVersionLocalizationUpdateRequest) -> Request<AppStoreVersionLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersionLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}
