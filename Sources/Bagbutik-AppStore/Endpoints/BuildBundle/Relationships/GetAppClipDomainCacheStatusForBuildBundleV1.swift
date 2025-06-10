import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the App Clip Domain Cache Status Information for a Build Bundle
     Get the cache status of the domain you associate with your App Clip for a specific build bundle.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildBundles-_id_-appClipDomainCacheStatus>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipDomainCacheStatusForBuildBundleV1(id: String,
                                                            fields: [GetAppClipDomainCacheStatusForBuildBundleV1.Field]? = nil) -> Request<AppClipDomainStatusResponse, ErrorResponse> {
        .init(
            path: "/v1/buildBundles/\(id)/appClipDomainCacheStatus",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAppClipDomainCacheStatusForBuildBundleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appClipDomainStatuses
        case appClipDomainStatuses([AppClipDomainStatuses])

        public enum AppClipDomainStatuses: String, Sendable, ParameterValue, Codable, CaseIterable {
            case domains
            case lastUpdatedDate
        }
    }
}
