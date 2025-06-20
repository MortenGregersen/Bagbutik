import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appEventLocalizations/{id}/appEventScreenshots

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEventLocalizations-_id_-appEventScreenshots>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppEventScreenshotsForAppEventLocalizationV1(id: String,
                                                                 fields: [ListAppEventScreenshotsForAppEventLocalizationV1.Field]? = nil,
                                                                 includes: [ListAppEventScreenshotsForAppEventLocalizationV1.Include]? = nil,
                                                                 limit: Int? = nil) -> Request<AppEventScreenshotsResponse, ErrorResponse> {
        .init(
            path: "/v1/appEventLocalizations/\(id)/appEventScreenshots",
            method: .get,
            parameters: .init(
                fields: fields,
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

        public enum AppEventLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appEvent
            case appEventScreenshots
            case appEventVideoClips
            case locale
            case longDescription
            case name
            case shortDescription
        }

        public enum AppEventScreenshots: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appEventAssetType
            case appEventLocalization
            case assetDeliveryState
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appEventLocalization
    }
}
