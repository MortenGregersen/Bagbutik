import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersionExperimentTreatmentLocalizations/{id}/appScreenshotSets

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appstoreversionexperimenttreatmentlocalizations_id_appscreenshotsets>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppScreenshotSetsForAppStoreVersionExperimentTreatmentLocalizationV1(id: String,
                                                                                         fields: [ListAppScreenshotSetsForAppStoreVersionExperimentTreatmentLocalizationV1.Field]? = nil,
                                                                                         filters: [ListAppScreenshotSetsForAppStoreVersionExperimentTreatmentLocalizationV1.Filter]? = nil,
                                                                                         includes: [ListAppScreenshotSetsForAppStoreVersionExperimentTreatmentLocalizationV1.Include]? = nil,
                                                                                         limits: [ListAppScreenshotSetsForAppStoreVersionExperimentTreatmentLocalizationV1.Limit]? = nil) -> Request<AppScreenshotSetsResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersionExperimentTreatmentLocalizations/\(id)/appScreenshotSets", method: .get, parameters: .init(fields: fields,
                                                                                                                                   filters: filters,
                                                                                                                                   includes: includes,
                                                                                                                                   limits: limits))
    }
}

public enum ListAppScreenshotSetsForAppStoreVersionExperimentTreatmentLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCustomProductPageLocalizations
        case appCustomProductPageLocalizations([AppCustomProductPageLocalizations])
        /// The fields to include for returned resources of type appScreenshotSets
        case appScreenshotSets([AppScreenshotSets])
        /// The fields to include for returned resources of type appScreenshots
        case appScreenshots([AppScreenshots])
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatmentLocalizations
        case appStoreVersionExperimentTreatmentLocalizations([AppStoreVersionExperimentTreatmentLocalizations])
        /// The fields to include for returned resources of type appStoreVersionLocalizations
        case appStoreVersionLocalizations([AppStoreVersionLocalizations])

        public enum AppCustomProductPageLocalizations: String, ParameterValue, CaseIterable {
            case appCustomProductPageVersion
            case appPreviewSets
            case appScreenshotSets
            case locale
            case promotionalText
        }

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

        public enum AppStoreVersionExperimentTreatmentLocalizations: String, ParameterValue, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersionExperimentTreatment
            case locale
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
        /// Filter by id(s) of related 'appCustomProductPageLocalization'
        case appCustomProductPageLocalization([String])
        /// Filter by id(s) of related 'appStoreVersionLocalization'
        case appStoreVersionLocalization([String])
        /// Filter by attribute 'screenshotDisplayType'
        case screenshotDisplayType([ScreenshotDisplayType])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appCustomProductPageLocalization
        case appScreenshots
        case appStoreVersionExperimentTreatmentLocalization
        case appStoreVersionLocalization
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appScreenshots returned (when they are included) - maximum 50
        case appScreenshots(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
