public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appstoreversionexperiments_id_appstoreversionexperimenttreatments>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppStoreVersionExperimentTreatmentsForAppStoreVersionExperiment(id: String,
                                                                                    fields: [ListAppStoreVersionExperimentTreatmentsForAppStoreVersionExperiment.Field]? = nil,
                                                                                    includes: [ListAppStoreVersionExperimentTreatmentsForAppStoreVersionExperiment.Include]? = nil,
                                                                                    limits: [ListAppStoreVersionExperimentTreatmentsForAppStoreVersionExperiment.Limit]? = nil) -> Request<AppStoreVersionExperimentTreatmentsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersionExperiments/\(id)/appStoreVersionExperimentTreatments", method: .get, parameters: .init(fields: fields,
                                                                                                                                       includes: includes,
                                                                                                                                       limits: limits))
    }
}

public enum ListAppStoreVersionExperimentTreatmentsForAppStoreVersionExperiment {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatmentLocalizations
        case appStoreVersionExperimentTreatmentLocalizations([AppStoreVersionExperimentTreatmentLocalizations])
        /// The fields to include for returned resources of type appStoreVersionExperimentTreatments
        case appStoreVersionExperimentTreatments([AppStoreVersionExperimentTreatments])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appStoreVersionExperiment, appStoreVersionExperimentTreatmentLocalizations
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related appStoreVersionExperimentTreatmentLocalizations returned (when they are included) - maximum 50
        case appStoreVersionExperimentTreatmentLocalizations(Int)
    }
}
