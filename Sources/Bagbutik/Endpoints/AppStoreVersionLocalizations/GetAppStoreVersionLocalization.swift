public extension Request {
    /**
      # Read App Store Version Localization Information
      Read localized version-level information.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_store_version_localization_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppStoreVersionLocalization(id: String,
                                               fields: [GetAppStoreVersionLocalization.Field]? = nil,
                                               includes: [GetAppStoreVersionLocalization.Include]? = nil,
                                               limits: [GetAppStoreVersionLocalization.Limit]? = nil) -> Request<AppStoreVersionLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersionLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                     includes: includes,
                                                                                                     limits: limits))
    }
}

public enum GetAppStoreVersionLocalization {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPreviewSets
        case appPreviewSets([AppPreviewSets])
        /// The fields to include for returned resources of type appScreenshotSets
        case appScreenshotSets([AppScreenshotSets])
        /// The fields to include for returned resources of type appStoreVersionLocalizations
        case appStoreVersionLocalizations([AppStoreVersionLocalizations])

        public enum AppPreviewSets: String, ParameterValue, CaseIterable {
            case appPreviews
            case appStoreVersionLocalization
            case previewType
        }

        public enum AppScreenshotSets: String, ParameterValue, CaseIterable {
            case appScreenshots
            case appStoreVersionLocalization
            case screenshotDisplayType
        }

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

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appPreviewSets, appScreenshotSets, appStoreVersion
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appPreviewSets returned (when they are included) - maximum 50
        case appPreviewSets(Int)
        /// Maximum number of related appScreenshotSets returned (when they are included) - maximum 50
        case appScreenshotSets(Int)
    }
}
