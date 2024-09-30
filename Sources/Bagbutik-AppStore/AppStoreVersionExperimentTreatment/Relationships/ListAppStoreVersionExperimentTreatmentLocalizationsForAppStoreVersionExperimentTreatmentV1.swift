import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersionExperimentTreatments/{id}/appStoreVersionExperimentTreatmentLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appstoreversionexperimenttreatments_id_appstoreversionexperimenttreatmentlocalizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatmentV1(id: String,
                                                                                                           fields: [ListAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatmentV1.Field]? = nil,
                                                                                                           filters: [ListAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatmentV1.Filter]? = nil,
                                                                                                           includes: [ListAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatmentV1.Include]? = nil,
                                                                                                           limits: [ListAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatmentV1.Limit]? = nil) -> Request<AppStoreVersionExperimentTreatmentLocalizationsResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersionExperimentTreatments/\(id)/appStoreVersionExperimentTreatmentLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                                                                                     filters: filters,
                                                                                                                                                     includes: includes,
                                                                                                                                                     limits: limits))
    }
}

public enum ListAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatmentV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPreviewSets
        case appPreviewSets([AppPreviewSets])
        /// The fields to include for returned resources of type appScreenshotSets
        case appScreenshotSets([AppScreenshotSets])
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatmentLocalizations
        case appStoreVersionExperimentTreatmentLocalizations([AppStoreVersionExperimentTreatmentLocalizations])
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatments
        case appStoreVersionExperimentTreatments([AppStoreVersionExperimentTreatments])

        public enum AppPreviewSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageLocalization
            case appPreviews
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case previewType
        }

        public enum AppScreenshotSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appCustomProductPageLocalization
            case appScreenshots
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case screenshotDisplayType
        }

        public enum AppStoreVersionExperimentTreatmentLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersionExperimentTreatment
            case locale
        }

        public enum AppStoreVersionExperimentTreatments: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appIcon
            case appIconName
            case appStoreVersionExperiment
            case appStoreVersionExperimentTreatmentLocalizations
            case appStoreVersionExperimentV2
            case name
            case promotedDate
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'locale'
        case locale([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appPreviewSets
        case appScreenshotSets
        case appStoreVersionExperimentTreatment
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appPreviewSets returned (when they are included) - maximum 50
        case appPreviewSets(Int)
        /// Maximum number of related appScreenshotSets returned (when they are included) - maximum 50
        case appScreenshotSets(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
