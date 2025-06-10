import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the App Store Version Phased Release Information of an App Store Version
     Read the phased release status and configuration for a version with phased release enabled.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-appStoreVersionPhasedRelease>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreVersionPhasedReleaseForAppStoreVersionV1(id: String,
                                                                    fields: [GetAppStoreVersionPhasedReleaseForAppStoreVersionV1.Field]? = nil) -> Request<AppStoreVersionPhasedReleaseWithoutIncludesResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/appStoreVersionPhasedRelease",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAppStoreVersionPhasedReleaseForAppStoreVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersionPhasedReleases
        case appStoreVersionPhasedReleases([AppStoreVersionPhasedReleases])

        public enum AppStoreVersionPhasedReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currentDayNumber
            case phasedReleaseState
            case startDate
            case totalPauseDuration
        }
    }
}
