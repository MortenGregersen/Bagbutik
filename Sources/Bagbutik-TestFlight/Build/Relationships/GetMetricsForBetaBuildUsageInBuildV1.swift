import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read usage metrics for a beta build
     Get usage metrics for a specific build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_usage_metrics_for_a_beta_build>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForBetaBuildUsageInBuildV1(id: String,
                                                     limit: Int? = nil) -> Request<BetaBuildUsagesV1MetricResponse, ErrorResponse>
    {
        .init(path: "/v1/builds/\(id)/metrics/betaBuildUsages", method: .get, parameters: .init(limit: limit))
    }
}
