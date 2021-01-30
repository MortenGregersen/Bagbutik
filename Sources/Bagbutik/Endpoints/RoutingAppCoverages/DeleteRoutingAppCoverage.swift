public extension Request {
    /**
      # Delete a Routing App Coverage
      Delete the routing app coverage file that is associated with a version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_routing_app_coverage>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteRoutingAppCoverage(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/routingAppCoverages/\(id)", method: .delete)
    }
}
