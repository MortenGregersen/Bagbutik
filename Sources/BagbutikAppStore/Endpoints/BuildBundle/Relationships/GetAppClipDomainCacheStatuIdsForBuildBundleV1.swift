import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Get the App Clip domain cache status ID for a build bundle

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
