public extension Request {
    /**
      # List All App Preview Sets for an App Store Version Localization
      List all app preview sets for a specific localization.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_preview_sets_for_an_app_store_version_localization>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppPreviewSetsForAppStoreVersionLocalization(id: String,
                                                                 fields: [ListAppPreviewSetsForAppStoreVersionLocalization.Field]? = nil,
                                                                 filters: [ListAppPreviewSetsForAppStoreVersionLocalization.Filter]? = nil,
                                                                 includes: [ListAppPreviewSetsForAppStoreVersionLocalization.Include]? = nil,
                                                                 limit: Int? = nil) -> Request<AppPreviewSetsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersionLocalizations/\(id)/appPreviewSets", method: .get, parameters: .init(fields: fields,
                                                                                                                    filters: filters,
                                                                                                                    includes: includes,
                                                                                                                    limit: limit))
    }
}

public enum ListAppPreviewSetsForAppStoreVersionLocalization {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPreviewSets
        case appPreviewSets([AppPreviewSets])
        /// The fields to include for returned resources of type appPreviews
        case appPreviews([AppPreviews])
        /// The fields to include for returned resources of type appStoreVersionLocalizations
        case appStoreVersionLocalizations([AppStoreVersionLocalizations])

        public enum AppPreviewSets: String, ParameterValue, CaseIterable {
            case appPreviews
            case appStoreVersionLocalization
            case previewType
        }

        public enum AppPreviews: String, ParameterValue, CaseIterable {
            case appPreviewSet
            case assetDeliveryState
            case fileName
            case fileSize
            case mimeType
            case previewFrameTimeCode
            case previewImage
            case sourceFileChecksum
            case uploadOperations
            case uploaded
            case videoUrl
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'previewType'
        case previewType([PreviewType])

        /// String that represents the display type of an app preview.
        public enum PreviewType: String, ParameterValue, CaseIterable {
            case iPhone65 = "IPHONE_65"
            case iPhone58 = "IPHONE_58"
            case iPhone55 = "IPHONE_55"
            case iPhone47 = "IPHONE_47"
            case iPhone40 = "IPHONE_40"
            case iPhone35 = "IPHONE_35"
            case iPadPro3Gen129 = "IPAD_PRO_3GEN_129"
            case iPadPro3Gen11 = "IPAD_PRO_3GEN_11"
            case iPadPro129 = "IPAD_PRO_129"
            case iPad105 = "IPAD_105"
            case iPad97 = "IPAD_97"
            case desktop = "DESKTOP"
            case watchSeries4 = "WATCH_SERIES_4"
            case watchSeries3 = "WATCH_SERIES_3"
            case appleTV = "APPLE_TV"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appPreviews, appStoreVersionLocalization
    }
}
