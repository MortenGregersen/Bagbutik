import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read public link usage metrics for a beta group
     Get public link usage metrics for a specific beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaGroups-_id_-metrics-publicLinkUsages>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForPublicLinkUsageInBetaGroupV1(id: String,
                                                          limit: Int? = nil) -> Request<BetaPublicLinkUsagesV1MetricResponse, ErrorResponse> {
        .init(
            path: "/v1/betaGroups/\(id)/metrics/publicLinkUsages",
            method: .get,
            parameters: .init(limit: limit))
    }
}
