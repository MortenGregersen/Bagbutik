import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/buildBundles/{id}/relationships/appClipDomainCacheStatus

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildBundles-_id_-relationships-appClipDomainCacheStatus>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppClipDomainCacheStatuIdsForBuildBundleV1(id: String) -> Request<BuildBundleAppClipDomainCacheStatusLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/buildBundles/\(id)/relationships/appClipDomainCacheStatus",
            method: .get)
    }
}
