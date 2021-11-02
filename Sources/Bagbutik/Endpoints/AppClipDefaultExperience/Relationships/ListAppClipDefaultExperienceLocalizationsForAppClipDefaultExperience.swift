public extension Request {
    /**
      # Read Localization Information for a Default App Clip Experience
      Get localized metadata that appears on the App Clip card for a specific default App Clip experience.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_localization_information_for_a_default_app_clip_experience>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppClipDefaultExperienceLocalizationsForAppClipDefaultExperience(id: String,
                                                                                     fields: [ListAppClipDefaultExperienceLocalizationsForAppClipDefaultExperience.Field]? = nil,
                                                                                     filters: [ListAppClipDefaultExperienceLocalizationsForAppClipDefaultExperience.Filter]? = nil,
                                                                                     limit: Int? = nil) -> Request<AppClipDefaultExperienceLocalizationsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClipDefaultExperiences/\(id)/appClipDefaultExperienceLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                                                                        filters: filters,
                                                                                                                                        limit: limit))
    }
}

public enum ListAppClipDefaultExperienceLocalizationsForAppClipDefaultExperience {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipDefaultExperienceLocalizations
        case appClipDefaultExperienceLocalizations([AppClipDefaultExperienceLocalizations])

        public enum AppClipDefaultExperienceLocalizations: String, ParameterValue, CaseIterable {
            case appClipDefaultExperience
            case appClipHeaderImage
            case locale
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
