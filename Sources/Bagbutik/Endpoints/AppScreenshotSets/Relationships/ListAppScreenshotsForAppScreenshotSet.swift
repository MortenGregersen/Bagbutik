public extension Request {
    /**
      # List All App Screenshots for an App Screenshot Set
      List all ordered screenshots in a screenshot set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_screenshots_for_an_app_screenshot_set>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppScreenshotsForAppScreenshotSet(id: String,
                                                      fields: [ListAppScreenshotsForAppScreenshotSet.Field]? = nil,
                                                      limit: Int? = nil) -> Request<AppScreenshotsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appScreenshotSets/\(id)/appScreenshots", method: .get, parameters: .init(fields: fields,
                                                                                                         limit: limit))
    }
}

public enum ListAppScreenshotsForAppScreenshotSet {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appScreenshots
        case appScreenshots([AppScreenshots])

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
}
