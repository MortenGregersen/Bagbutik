import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Routing App Coverage
     Commit a routing app coverage file after uploading it.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-routingAppCoverages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: RoutingAppCoverage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateRoutingAppCoverageV1(id: String,
                                           requestBody: RoutingAppCoverageUpdateRequest) -> Request<RoutingAppCoverageResponse, ErrorResponse>
    {
        .init(path: "/v1/routingAppCoverages/\(id)", method: .patch, requestBody: requestBody)
    }
}
