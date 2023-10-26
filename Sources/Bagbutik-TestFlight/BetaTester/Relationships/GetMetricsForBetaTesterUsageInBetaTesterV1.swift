import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read beta tester usage metrics
     Get usage metrics for a specific beta tester.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_beta_tester_usage_metrics>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter period: The duration of the reporting period
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForBetaTesterUsageInBetaTesterV1(id: String,
                                                           filters: [GetMetricsForBetaTesterUsageInBetaTesterV1.Filter]? = nil,
                                                           period: String? = nil,
                                                           limit: Int? = nil) -> Request<BetaTesterUsagesV1MetricResponse, ErrorResponse>
    {
        var customs = [String: String]()
        if let period { customs["period"] = period }
        return .init(path: "/v1/betaTesters/\(id)/metrics/betaTesterUsages", method: .get, parameters: .init(filters: filters,
                                                                                                             limit: limit,
                                                                                                             customs: customs))
    }
}

public enum GetMetricsForBetaTesterUsageInBetaTesterV1 {
    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by 'apps' relationship dimension
        case apps([String])
    }
}
