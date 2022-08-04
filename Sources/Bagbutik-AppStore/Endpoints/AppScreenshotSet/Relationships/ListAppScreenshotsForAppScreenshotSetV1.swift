import Bagbutik_Core

public extension Request {
    /**
     # List All App Screenshots for an App Screenshot Set
     List all ordered screenshots in a screenshot set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_app_screenshots_for_an_app_screenshot_set>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppScreenshotsForAppScreenshotSetV1(id: String,
                                                        fields: [ListAppScreenshotsForAppScreenshotSetV1.Field]? = nil,
                                                        includes: [ListAppScreenshotsForAppScreenshotSetV1.Include]? = nil,
                                                        limit: Int? = nil) -> Request<AppScreenshotsResponse, ErrorResponse>
    {
        .init(path: "/v1/appScreenshotSets/\(id)/appScreenshots", method: .get, parameters: .init(fields: fields,
                                                                                                  includes: includes,
                                                                                                  limit: limit))
    }
}

public enum ListAppScreenshotsForAppScreenshotSetV1 {
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
        case appScreenshotSet
    }
}
