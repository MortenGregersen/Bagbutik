public extension Request {
    /**
      # Read App Screenshot Set Information
      Get an app screenshot set including its display target, language, and the screenshot it contains.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_app_screenshot_set_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum number of related appScreenshots returned (when they are included) - maximum 50
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppScreenshotSetV1(id: String,
                                      fields: [GetAppScreenshotSetV1.Field]? = nil,
                                      includes: [GetAppScreenshotSetV1.Include]? = nil,
                                      limit: Int? = nil) -> Request<AppScreenshotSetResponse, ErrorResponse>
    {
        return .init(path: "/v1/appScreenshotSets/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                          includes: includes,
                                                                                          limit: limit))
    }
}

public enum V1GetAppScreenshotSet {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appScreenshotSets
        case appScreenshotSets([AppScreenshotSets])
        /// The fields to include for returned resources of type appScreenshots
        case appScreenshots([AppScreenshots])

        public enum AppScreenshotSets: String, ParameterValue, CaseIterable {
            case appCustomProductPageLocalization
            case appScreenshots
            case appStoreVersionExperimentTreatmentLocalization
            case appStoreVersionLocalization
            case screenshotDisplayType
        }

        public enum AppScreenshots: String, ParameterValue, CaseIterable {
            case appScreenshotSet
            case assetDeliveryState
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case uploadOperations
            case uploaded
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appCustomProductPageLocalization, appScreenshots, appStoreVersionExperimentTreatmentLocalization, appStoreVersionLocalization
    }
}
