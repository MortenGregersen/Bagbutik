import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List file size IDs for a build bundle

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-buildBundles-_id_-relationships-buildBundleFileSizes>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildBundleFileSizeIdsForBuildBundleV1(id: String,
                                                           limit: Int? = nil) -> Request<BuildBundleBuildBundleFileSizesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/buildBundles/\(id)/relationships/buildBundleFileSizes",
            method: .get,
            parameters: .init(limit: limit))
    }
}
