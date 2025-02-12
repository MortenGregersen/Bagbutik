import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all treatments for an App Store Experiment v1
     Get a list of all treatments for a specific App Store version experiment.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersionExperiments-_id_-appStoreVersionExperimentTreatments>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
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

        public enum AppStoreVersionExperiments: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersion
            case appStoreVersionExperimentTreatments
            case controlVersions
            case endDate
            case latestControlVersion
            case name
            case platform
            case reviewRequired
            case startDate
            case state
            case trafficProportion
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appStoreVersionExperiment
        case appStoreVersionExperimentTreatmentLocalizations
        case appStoreVersionExperimentV2
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
