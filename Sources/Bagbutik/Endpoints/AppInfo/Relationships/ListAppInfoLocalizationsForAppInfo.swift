public extension Request {
    /**
      # List All App Info Localizations for an App Info
      Get a list of localized, app-level information for an app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_info_localizations_for_an_app_info>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppInfoLocalizationsForAppInfo(id: String,
                                                   fields: [ListAppInfoLocalizationsForAppInfo.Field]? = nil,
                                                   filters: [ListAppInfoLocalizationsForAppInfo.Filter]? = nil,
                                                   limit: Int? = nil) -> Request<AppInfoLocalizationsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appInfos/\(id)/appInfoLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                                      filters: filters,
                                                                                                      limit: limit))
    }
}

public enum ListAppInfoLocalizationsForAppInfo {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appInfoLocalizations
        case appInfoLocalizations([AppInfoLocalizations])

        public enum AppInfoLocalizations: String, ParameterValue, CaseIterable {
            case appInfo
            case locale
            case name
            case privacyChoicesUrl
            case privacyPolicyText
            case privacyPolicyUrl
            case subtitle
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'locale'
        case locale([String])
    }
}
