public extension Request {
    /**
      # List All App Store Version Localizations for an App Store Version
      Get a list of localized, version-level information about an app, for all locales.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_store_version_localizations_for_an_app_store_version>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppStoreVersionLocalizationsForAppStoreVersionV1(id: String,
                                                                     fields: [ListAppStoreVersionLocalizationsForAppStoreVersionV1.Field]? = nil,
                                                                     limit: Int? = nil) -> Request<AppStoreVersionLocalizationsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersions/\(id)/appStoreVersionLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                                                      limit: limit))
    }
}

public enum ListAppStoreVersionLocalizationsForAppStoreVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersionLocalizations
        case appStoreVersionLocalizations([AppStoreVersionLocalizations])

        public enum AppStoreVersionLocalizations: String, ParameterValue, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersion
            case description
            case keywords
            case locale
            case marketingUrl
            case promotionalText
            case supportUrl
            case whatsNew
        }
    }
}
