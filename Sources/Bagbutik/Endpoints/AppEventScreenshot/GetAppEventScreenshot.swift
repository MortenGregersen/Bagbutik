public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appeventscreenshots_id>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppEventScreenshot(id: String,
                                      fields: [GetAppEventScreenshot.Field]? = nil,
                                      includes: [GetAppEventScreenshot.Include]? = nil) -> Request<AppEventScreenshotResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEventScreenshots/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                            includes: includes))
    }
}

public enum GetAppEventScreenshot {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEventScreenshots
        case appEventScreenshots([AppEventScreenshots])

        public enum AppEventScreenshots: String, ParameterValue, CaseIterable {
            case appEventAssetType
            case appEventLocalization
            case assetDeliveryState
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations
            case uploaded
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appEventLocalization
    }
}
