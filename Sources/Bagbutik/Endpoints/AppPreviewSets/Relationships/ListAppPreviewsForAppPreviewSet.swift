public extension Request {
    enum ListAppPreviewsForAppPreviewSet {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appPreviewSets
            case appPreviewSets([AppPreviewSets])
            /// The fields to include for returned resources of type appPreviews
            case appPreviews([AppPreviews])

            public enum AppPreviewSets: String, ParameterValue, CaseIterable {
                case appPreviews
                case appStoreVersionLocalization
                case previewType
            }

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

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case appPreviewSet
        }
    }

    /**
      # List All App Previews for an App Preview Set
      List all ordered app previews in a preview set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_previews_for_an_app_preview_set>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppPreviewsForAppPreviewSet(id: String,
                                                fields: [ListAppPreviewsForAppPreviewSet.Field]? = nil,
                                                includes: [ListAppPreviewsForAppPreviewSet.Include]? = nil,
                                                limit: Int? = nil) -> Request<AppPreviewsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appPreviewSets/\(id)/appPreviews", method: .get, parameters: .init(fields: fields,
                                                                                                   includes: includes,
                                                                                                   limit: limit))
    }
}
