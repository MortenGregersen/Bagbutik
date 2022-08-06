import Bagbutik_Models

public extension Request {
    /**
     # Delete a Routing App Coverage
     Delete the routing app coverage file that is associated with a version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_routing_app_coverage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteRoutingAppCoverageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/routingAppCoverages/\(id)", method: .delete)
    }
}
