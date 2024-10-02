import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Store experiment information v1
     Get information for a specific App Store version experiment.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersionExperiments-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related appStoreVersionExperimentTreatments returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getAppStoreVersionExperimentV1(id: String,
                                               fields: [GetAppStoreVersionExperimentV1.Field]? = nil,
                                               includes: [GetAppStoreVersionExperimentV1.Include]? = nil,
                                               limit: GetAppStoreVersionExperimentV1.Limit? = nil) -> Request<AppStoreVersionExperimentResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersionExperiments/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                            includes: includes,
                                                                                            limits: limit.map { [$0] }))
    }
}

public enum GetAppStoreVersionExperimentV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatments
        case appStoreVersionExperimentTreatments([AppStoreVersionExperimentTreatments])
        /// The fields to include for returned resources of type appStoreVersionExperiments
        case appStoreVersionExperiments([AppStoreVersionExperiments])

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
    public enum Include: String, IncludeParameter, CaseIterable {
        case appStoreVersion
        case appStoreVersionExperimentTreatments
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appStoreVersionExperimentTreatments returned (when they are included) - maximum 50
        case appStoreVersionExperimentTreatments(Int)
    }
}
