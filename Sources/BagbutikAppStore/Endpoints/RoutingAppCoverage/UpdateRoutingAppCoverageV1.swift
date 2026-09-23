import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a routing app coverage

     Commit a routing app coverage file after uploading it.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-routingAppCoverages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: RoutingAppCoverage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateRoutingAppCoverageV1(id: String,
                                           requestBody: RoutingAppCoverageUpdateRequest) -> Request<RoutingAppCoverageResponse, ErrorResponse> {
        .init(
            path: "/v1/routingAppCoverages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
