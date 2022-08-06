import Bagbutik_Models

public extension Request {
    /**
     # Create a Routing App Coverage
     Attach a routing app coverage file to an App Store version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_routing_app_coverage>

     - Parameter requestBody: RoutingAppCoverage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createRoutingAppCoverageV1(requestBody: RoutingAppCoverageCreateRequest) -> Request<RoutingAppCoverageResponse, ErrorResponse> {
        .init(path: "/v1/routingAppCoverages", method: .post, requestBody: requestBody)
    }
}
