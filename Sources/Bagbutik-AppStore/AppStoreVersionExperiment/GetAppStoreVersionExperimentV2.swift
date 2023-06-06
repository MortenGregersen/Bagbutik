import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Store experiment information v1
     Get information for a specific App Store version experiment.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appstoreversionexperiments_id>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreVersionExperimentV2(id: String,
                                               fields: [GetAppStoreVersionExperimentV2.Field]? = nil,
                                               includes: [GetAppStoreVersionExperimentV2.Include]? = nil,
                                               limits: [GetAppStoreVersionExperimentV2.Limit]? = nil) -> Request<AppStoreVersionExperimentV2Response, ErrorResponse>
    {
        .init(path: "/v2/appStoreVersionExperiments/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                            includes: includes,
                                                                                            limits: limits))
    }
}

public enum GetAppStoreVersionExperimentV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatments
        case appStoreVersionExperimentTreatments([AppStoreVersionExperimentTreatments])
        /// The fields to include for returned resources of type appStoreVersionExperiments
        case appStoreVersionExperiments([AppStoreVersionExperiments])

        public enum AppStoreVersionExperimentTreatments: String, ParameterValue, Codable, CaseIterable {
            case appIcon
            case appIconName
            case appStoreVersionExperiment
            case appStoreVersionExperimentTreatmentLocalizations
            case appStoreVersionExperimentV2
            case name
            case promotedDate
        }

        public enum AppStoreVersionExperiments: String, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionExperimentTreatments
            case controlVersions
            case endDate
            case latestControlVersion
            case name
            case platform
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
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case appStoreVersionExperimentTreatments
        case controlVersions
        case latestControlVersion
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appStoreVersionExperimentTreatments returned (when they are included) - maximum 50
        case appStoreVersionExperimentTreatments(Int)
        /// Maximum number of related controlVersions returned (when they are included) - maximum 50
        case controlVersions(Int)
    }
}
