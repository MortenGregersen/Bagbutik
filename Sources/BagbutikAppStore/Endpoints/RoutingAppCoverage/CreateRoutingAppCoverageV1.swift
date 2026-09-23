import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a routing app coverage

     Attach a routing app coverage file to an App Store version.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-routingAppCoverages>

     - Parameter requestBody: RoutingAppCoverage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createRoutingAppCoverageV1(requestBody: RoutingAppCoverageCreateRequest) -> Request<RoutingAppCoverageResponse, ErrorResponse> {
        .init(
            path: "/v1/routingAppCoverages",
            method: .post,
            requestBody: requestBody)
    }
}
