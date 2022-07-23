public extension Request {
    /**
      # GET /v1/appStoreVersionExperimentTreatmentLocalizations/{id}

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appstoreversionexperimenttreatmentlocalizations_id>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppStoreVersionExperimentTreatmentLocalizationV1(id: String,
                                                                    fields: [GetAppStoreVersionExperimentTreatmentLocalizationV1.Field]? = nil,
                                                                    includes: [GetAppStoreVersionExperimentTreatmentLocalizationV1.Include]? = nil,
                                                                    limits: [GetAppStoreVersionExperimentTreatmentLocalizationV1.Limit]? = nil) -> Request<AppStoreVersionExperimentTreatmentLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersionExperimentTreatmentLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                                        includes: includes,
                                                                                                                        limits: limits))
    }
}

public enum GetAppStoreVersionExperimentTreatmentLocalizationV1 {
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

        public enum AppPreviewSets: String, ParameterValue, CaseIterable {
            case appCustomProductPageLocalization
            case appPreviews
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case previewType
        }

        public enum AppScreenshotSets: String, ParameterValue, CaseIterable {
            case appCustomProductPageLocalization
            case appScreenshots
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case screenshotDisplayType
        }

        public enum AppStoreVersionExperimentTreatmentLocalizations: String, ParameterValue, CaseIterable {
            case appPreviewSets
            case appScreenshotSets
            case appStoreVersionExperimentTreatment
            case locale
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appPreviewSets, appScreenshotSets, appStoreVersionExperimentTreatment
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appPreviewSets returned (when they are included) - maximum 50
        case appPreviewSets(Int)
        /// Maximum number of related appScreenshotSets returned (when they are included) - maximum 50
        case appScreenshotSets(Int)
    }
}
