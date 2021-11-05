public extension Request {
    /**
      # Read Advanced App Clip Experience Information
      Get information about a specific advanced App Clip experience.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_advanced_app_clip_experience_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related localizations returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppClipAdvancedExperience(id: String,
                                             fields: [GetAppClipAdvancedExperience.Field]? = nil,
                                             includes: [GetAppClipAdvancedExperience.Include]? = nil,
                                             limit: Int? = nil) -> Request<AppClipAdvancedExperienceResponse, ErrorResponse>
    {
        return .init(path: "/v1/appClipAdvancedExperiences/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                   includes: includes,
                                                                                                   limit: limit))
    }
}

public enum GetAppClipAdvancedExperience {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipAdvancedExperiences
        case appClipAdvancedExperiences([AppClipAdvancedExperiences])

        public enum AppClipAdvancedExperiences: String, ParameterValue, CaseIterable {
            case action
            case appClip
            case businessCategory
            case defaultLanguage
            case headerImage
            case isPoweredBy
            case link
            case localizations
            case place
            case placeStatus
            case removed
            case status
            case version
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appClip, headerImage, localizations
    }
}
