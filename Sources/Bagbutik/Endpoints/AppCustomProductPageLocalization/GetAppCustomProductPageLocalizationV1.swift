public extension Request {
    /**
      # GET /v1/appCustomProductPageLocalizations/{id}

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appcustomproductpagelocalizations_id>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppCustomProductPageLocalizationV1(id: String,
                                                      fields: [GetAppCustomProductPageLocalizationV1.Field]? = nil,
                                                      includes: [GetAppCustomProductPageLocalizationV1.Include]? = nil,
                                                      limits: [GetAppCustomProductPageLocalizationV1.Limit]? = nil) -> Request<AppCustomProductPageLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appCustomProductPageLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                          includes: includes,
                                                                                                          limits: limits))
    }
}

public enum GetAppCustomProductPageLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appCustomProductPageLocalizations
        case appCustomProductPageLocalizations([AppCustomProductPageLocalizations])
        /// The fields to include for returned resources of type appPreviewSets
        case appPreviewSets([AppPreviewSets])
        /// The fields to include for returned resources of type appScreenshotSets
        case appScreenshotSets([AppScreenshotSets])

        public enum AppCustomProductPageLocalizations: String, ParameterValue, CaseIterable {
            case appCustomProductPageVersion
            case appPreviewSets
            case appScreenshotSets
            case locale
            case promotionalText
        }

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appCustomProductPageVersion, appPreviewSets, appScreenshotSets
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
