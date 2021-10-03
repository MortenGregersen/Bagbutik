public extension Request {
    /**
      # List All App Previews for an App Preview Set
      List all ordered app previews in a preview set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_previews_for_an_app_preview_set>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppPreviewsForAppPreviewSet(id: String,
                                                fields: [ListAppPreviewsForAppPreviewSet.Field]? = nil,
                                                limit: Int? = nil) -> Request<AppPreviewsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPreviewSets/\(id)/appPreviews", method: .get, parameters: .init(fields: fields,
                                                                                                   limit: limit))
    }
}

public enum ListAppPreviewsForAppPreviewSet {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPreviews
        case appPreviews([AppPreviews])

        public enum AppPreviews: String, ParameterValue, CaseIterable {
            case appPreviewSet
            case assetDeliveryState
            case fileName
            case fileSize
            case mimeType
            case previewFrameTimeCode
            case previewImage
            case sourceFileChecksum
            case uploadOperations
            case uploaded
            case videoUrl
        }
    }
}
