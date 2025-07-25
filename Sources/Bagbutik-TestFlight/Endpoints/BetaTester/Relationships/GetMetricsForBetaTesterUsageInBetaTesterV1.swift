import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read beta tester usage metrics
     Get usage metrics for a specific beta tester.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaTesters-_id_-metrics-betaTesterUsages>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter period: The duration of the reporting period
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForBetaTesterUsageInBetaTesterV1(id: String,
                                                           filters: [GetMetricsForBetaTesterUsageInBetaTesterV1.Filter]? = nil,
                                                           period: GetMetricsForBetaTesterUsageInBetaTesterV1.Period? = nil,
                                                           limit: Int? = nil) -> Request<BetaTesterUsagesV1MetricResponse, ErrorResponse> {
        var customs = [String: String]()
        if let period { customs["period"] = period.rawValue }
        return .init(
            path: "/v1/betaTesters/\(id)/metrics/betaTesterUsages",
            method: .get,
            parameters: .init(
                filters: filters,
                limit: limit,
                customs: customs))
    }
}

public enum GetMetricsForBetaTesterUsageInBetaTesterV1 {
    /**
     Attributes, relationships, and IDs by which to filter.

     Required: `apps`
     */
    public enum Filter: FilterParameter {
        /// Filter by 'apps' relationship dimension
        case apps([String])
    }

    /**
     The duration of the reporting period
     */
    public enum Period: String, Sendable, ParameterValue, Codable, CaseIterable {
        case P30D
        case P365D
        case P7D
        case P90D
    }
}
