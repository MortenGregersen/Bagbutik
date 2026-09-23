import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Get the routing app coverage ID for an App Store version

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appStoreVersions-_id_-relationships-routingAppCoverage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRoutingAppCoverageIdsForAppStoreVersionV1(id: String) -> Request<AppStoreVersionRoutingAppCoverageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/appStoreVersions/\(id)/relationships/routingAppCoverage",
            method: .get)
    }
}
