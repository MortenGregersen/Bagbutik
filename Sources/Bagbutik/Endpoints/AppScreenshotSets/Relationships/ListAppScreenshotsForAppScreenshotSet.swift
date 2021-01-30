public extension Request {
    enum ListAppScreenshotsForAppScreenshotSet {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type appScreenshotSets
            case appScreenshotSets([AppScreenshotSets])
            /// The fields to include for returned resources of type appScreenshots
            case appScreenshots([AppScreenshots])

            public enum AppScreenshotSets: String, ParameterValue, CaseIterable {
                case appScreenshots
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
            case appScreenshotSet
        }
    }

    /**
      # List All App Screenshots for an App Screenshot Set
      List all ordered screenshots in a screenshot set.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_screenshots_for_an_app_screenshot_set>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listAppScreenshotsForAppScreenshotSet(id: String,
                                                      fields: [ListAppScreenshotsForAppScreenshotSet.Field]? = nil,
                                                      includes: [ListAppScreenshotsForAppScreenshotSet.Include]? = nil,
                                                      limit: Int? = nil) -> Request<AppScreenshotsResponse, ErrorResponse>
    {
        return .init(path: "/v1/appScreenshotSets/\(id)/appScreenshots", method: .get, parameters: .init(fields: fields,
                                                                                                         includes: includes,
                                                                                                         limit: limit))
    }
}
