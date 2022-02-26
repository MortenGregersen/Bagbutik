public extension Request {
    /**
      # No overview available

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appeventlocalizations_id_appeventscreenshots>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppEventScreenshotsForAppEventLocalization(id: String,
                                                               fields: [ListAppEventScreenshotsForAppEventLocalization.Field]? = nil,
                                                               limit: Int? = nil) -> Request<AppEventScreenshotsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEventLocalizations/\(id)/appEventScreenshots", method: .get, parameters: .init(fields: fields,
                                                                                                                  limit: limit))
    }
}

public enum ListAppEventScreenshotsForAppEventLocalization {
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
}
