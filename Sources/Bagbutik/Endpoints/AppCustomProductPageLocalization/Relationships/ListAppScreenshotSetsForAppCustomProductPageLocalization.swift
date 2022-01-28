public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appcustomproductpagelocalizations_id_appscreenshotsets>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppScreenshotSetsForAppCustomProductPageLocalization(id: String,
                                                                         fields: [ListAppScreenshotSetsForAppCustomProductPageLocalization.Field]? = nil,
                                                                         filters: [ListAppScreenshotSetsForAppCustomProductPageLocalization.Filter]? = nil,
                                                                         includes: [ListAppScreenshotSetsForAppCustomProductPageLocalization.Include]? = nil,
                                                                         limits: [ListAppScreenshotSetsForAppCustomProductPageLocalization.Limit]? = nil) -> Request<AppScreenshotSetsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appCustomProductPageLocalizations/\(id)/appScreenshotSets", method: .get, parameters: .init(fields: fields,
                                                                                                                            filters: filters,
                                                                                                                            includes: includes,
                                                                                                                            limits: limits))
    }
}

public enum ListAppScreenshotSetsForAppCustomProductPageLocalization {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appScreenshotSets
        case appScreenshotSets([AppScreenshotSets])
        /// The fields to include for returned resources of type appScreenshots
        case appScreenshots([AppScreenshots])

        public enum AppScreenshotSets: String, ParameterValue, CaseIterable {
            case appCustomProductPageLocalization
            case appScreenshots
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case screenshotDisplayType
        }

        public enum AppScreenshots: String, ParameterValue, CaseIterable {
            case appScreenshotSet
            case assetDeliveryState
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case uploadOperations
            case uploaded
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'appStoreVersionExperimentTreatmentLocalization'
        case appStoreVersionExperimentTreatmentLocalization([String])
        /// Filter by id(s) of related 'appStoreVersionLocalization'
        case appStoreVersionLocalization([String])
        /// Filter by attribute 'screenshotDisplayType'
        case screenshotDisplayType([ScreenshotDisplayType])

        /// String that represents the display type of an app screenshot.
        public enum ScreenshotDisplayType: String, ParameterValue, CaseIterable {
            case appIphone65 = "APP_IPHONE_65"
            case appIphone58 = "APP_IPHONE_58"
            case appIphone55 = "APP_IPHONE_55"
            case appIphone47 = "APP_IPHONE_47"
            case appIphone40 = "APP_IPHONE_40"
            case appIphone35 = "APP_IPHONE_35"
            case appIpadPro3Gen129 = "APP_IPAD_PRO_3GEN_129"
            case appIpadPro3Gen11 = "APP_IPAD_PRO_3GEN_11"
            case appIpadPro129 = "APP_IPAD_PRO_129"
            case appIpad105 = "APP_IPAD_105"
            case appIpad97 = "APP_IPAD_97"
            case appDesktop = "APP_DESKTOP"
            case appWatchSeries7 = "APP_WATCH_SERIES_7"
            case appWatchSeries4 = "APP_WATCH_SERIES_4"
            case appWatchSeries3 = "APP_WATCH_SERIES_3"
            case appAppleTV = "APP_APPLE_TV"
            case iMessageAppIphone65 = "IMESSAGE_APP_IPHONE_65"
            case iMessageAppIphone58 = "IMESSAGE_APP_IPHONE_58"
            case iMessageAppIphone55 = "IMESSAGE_APP_IPHONE_55"
            case iMessageAppIphone47 = "IMESSAGE_APP_IPHONE_47"
            case iMessageAppIphone40 = "IMESSAGE_APP_IPHONE_40"
            case iMessageAppIpadPro3Gen129 = "IMESSAGE_APP_IPAD_PRO_3GEN_129"
            case iMessageAppIpadPro3Gen11 = "IMESSAGE_APP_IPAD_PRO_3GEN_11"
            case iMessageAppIpadPro129 = "IMESSAGE_APP_IPAD_PRO_129"
            case iMessageAppIpad105 = "IMESSAGE_APP_IPAD_105"
            case iMessageAppIpad97 = "IMESSAGE_APP_IPAD_97"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appCustomProductPageLocalization, appScreenshots, appStoreVersionExperimentTreatmentLocalization, appStoreVersionLocalization
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related appScreenshots returned (when they are included) - maximum 50
        case appScreenshots(Int)
    }
}
