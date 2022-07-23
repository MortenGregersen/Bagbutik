public extension Request {
    /**
      # GET /v1/appEventLocalizations/{id}/appEventScreenshots

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_v1_appeventlocalizations_id_appeventscreenshots>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppEventScreenshotsForAppEventLocalizationV1(id: String,
                                                                 fields: [ListAppEventScreenshotsForAppEventLocalizationV1.Field]? = nil,
                                                                 includes: [ListAppEventScreenshotsForAppEventLocalizationV1.Include]? = nil,
                                                                 limit: Int? = nil) -> Request<AppEventScreenshotsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEventLocalizations/\(id)/appEventScreenshots", method: .get, parameters: .init(fields: fields,
                                                                                                                  includes: includes,
                                                                                                                  limit: limit))
    }
}

public enum ListAppEventScreenshotsForAppEventLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEventLocalizations
        case appEventLocalizations([AppEventLocalizations])
        /// The fields to include for returned resources of type appEventScreenshots
        case appEventScreenshots([AppEventScreenshots])

        public enum AppEventLocalizations: String, ParameterValue, CaseIterable {
            case appEvent
            case appEventScreenshots
            case appEventVideoClips
            case locale
            case longDescription
            case name
            case shortDescription
        }

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
