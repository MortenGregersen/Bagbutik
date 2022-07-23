public extension Request {
    /**
      # Modify an App Info Localization
      Modify localized app-level information for a particular language.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_app_info_localization>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AppInfoLocalization representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAppInfoLocalizationV1(id: String,
                                            requestBody: AppInfoLocalizationUpdateRequest) -> Request<AppInfoLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appInfoLocalizations/\(id)", method: .patch, requestBody: requestBody)
    }
}
