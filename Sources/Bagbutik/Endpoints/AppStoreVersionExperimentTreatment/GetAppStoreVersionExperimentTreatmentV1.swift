public extension Request {
    /**
      # GET /v1/appStoreVersionExperimentTreatments/{id}

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appstoreversionexperimenttreatments_id>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related appStoreVersionExperimentTreatmentLocalizations returned (when they are included) - maximum 50
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreVersionExperimentTreatmentV1(id: String,
                                                        fields: [GetAppStoreVersionExperimentTreatmentV1.Field]? = nil,
                                                        includes: [GetAppStoreVersionExperimentTreatmentV1.Include]? = nil,
                                                        limit: Int? = nil) -> Request<AppStoreVersionExperimentTreatmentResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersionExperimentTreatments/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                            includes: includes,
                                                                                                            limit: limit))
    }
}

public enum GetAppStoreVersionExperimentTreatmentV1 {
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
}
