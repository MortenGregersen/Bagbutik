public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appstoreversionexperimenttreatments_id_appstoreversionexperimenttreatmentlocalizations>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatment(id: String,
                                                                                                         fields: [ListAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatment.Field]? = nil,
                                                                                                         filters: [ListAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatment.Filter]? = nil,
                                                                                                         includes: [ListAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatment.Include]? = nil,
                                                                                                         limits: [ListAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatment.Limit]? = nil) -> Request<AppStoreVersionExperimentTreatmentLocalizationsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appStoreVersionExperimentTreatments/\(id)/appStoreVersionExperimentTreatmentLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                                                                                            filters: filters,
                                                                                                                                                            includes: includes,
                                                                                                                                                            limits: limits))
    }
}

public enum ListAppStoreVersionExperimentTreatmentLocalizationsForAppStoreVersionExperimentTreatment {
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
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'locale'
        case locale([String])
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
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related appScreenshotSets returned (when they are included) - maximum 50
        case appScreenshotSets(Int)
        /// Maximum number of related appPreviewSets returned (when they are included) - maximum 50
        case appPreviewSets(Int)
    }
}
