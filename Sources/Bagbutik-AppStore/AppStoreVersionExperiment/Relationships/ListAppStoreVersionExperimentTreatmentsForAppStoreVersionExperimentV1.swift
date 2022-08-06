import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appStoreVersionExperiments/{id}/appStoreVersionExperimentTreatments

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appstoreversionexperiments_id_appstoreversionexperimenttreatments>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppStoreVersionExperimentTreatmentsForAppStoreVersionExperimentV1(id: String,
                                                                                      fields: [ListAppStoreVersionExperimentTreatmentsForAppStoreVersionExperimentV1.Field]? = nil,
                                                                                      includes: [ListAppStoreVersionExperimentTreatmentsForAppStoreVersionExperimentV1.Include]? = nil,
                                                                                      limits: [ListAppStoreVersionExperimentTreatmentsForAppStoreVersionExperimentV1.Limit]? = nil) -> Request<AppStoreVersionExperimentTreatmentsResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersionExperiments/\(id)/appStoreVersionExperimentTreatments", method: .get, parameters: .init(fields: fields,
                                                                                                                                includes: includes,
                                                                                                                                limits: limits))
    }
}

public enum ListAppStoreVersionExperimentTreatmentsForAppStoreVersionExperimentV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatmentLocalizations
        case appStoreVersionExperimentTreatmentLocalizations([AppStoreVersionExperimentTreatmentLocalizations])
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatments
        case appStoreVersionExperimentTreatments([AppStoreVersionExperimentTreatments])
        /// The fields to include for returned resources of type appStoreVersionExperiments
        case appStoreVersionExperiments([AppStoreVersionExperiments])

        public enum AppStoreVersionExperimentTreatmentLocalizations: String, ParameterValue, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersionExperimentTreatment
            case locale
        }

        public enum AppStoreVersionExperimentTreatments: String, ParameterValue, CaseIterable {
            case appIcon
            case appIconName
            case appStoreVersionExperiment
            case appStoreVersionExperimentTreatmentLocalizations
            case name
            case promotedDate
        }

        public enum AppStoreVersionExperiments: String, ParameterValue, CaseIterable {
            case appStoreVersion
            case appStoreVersionExperimentTreatments
            case endDate
            case name
            case reviewRequired
            case startDate
            case started
            case state
            case trafficProportion
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appStoreVersionExperiment
        case appStoreVersionExperimentTreatmentLocalizations
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appStoreVersionExperimentTreatmentLocalizations returned (when they are included) - maximum 50
        case appStoreVersionExperimentTreatmentLocalizations(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
