public extension Request {
    /**
      # Create a Routing App Coverage
      Attach a routing app coverage file to an App Store version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_a_routing_app_coverage>

      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createRoutingAppCoverage(requestBody: RoutingAppCoverageCreateRequest) -> Request<RoutingAppCoverageResponse, ErrorResponse> {
        return .init(path: "/v1/routingAppCoverages", method: .post, requestBody: requestBody)
    }
}
