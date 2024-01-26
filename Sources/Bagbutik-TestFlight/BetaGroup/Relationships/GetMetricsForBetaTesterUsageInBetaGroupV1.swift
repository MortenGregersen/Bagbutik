import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read metrics for beta testers in a beta group
     Get beta tester usage metrics for a beta group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_metrics_for_beta_testers_in_a_beta_group>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter groupBy: The dimension by which to group the results
     - Parameter period: The duration of the reporting period
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForBetaTesterUsageInBetaGroupV1(id: String,
                                                          filters: [GetMetricsForBetaTesterUsageInBetaGroupV1.Filter]? = nil,
                                                          groupBy: GetMetricsForBetaTesterUsageInBetaGroupV1.GroupBy? = nil,
                                                          period: GetMetricsForBetaTesterUsageInBetaGroupV1.Period? = nil,
                                                          limit: Int? = nil) -> Request<AppsBetaTesterUsagesV1MetricResponse, ErrorResponse>
    {
        var customs = [String: String]()
        if let groupBy { customs["groupBy"] = groupBy.rawValue }
        if let period { customs["period"] = period.rawValue }
        return .init(path: "/v1/betaGroups/\(id)/metrics/betaTesterUsages", method: .get, parameters: .init(filters: filters,
                                                                                                            limit: limit,
                                                                                                            customs: customs))
    }
}

public enum GetMetricsForBetaTesterUsageInBetaGroupV1 {
    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by 'betaTesters' relationship dimension
        case betaTesters([String])
    }

    /**
     The dimension by which to group the results
     */
    public enum GroupBy: String, ParameterValue, Codable, CaseIterable {
        case betaTesters
    }

    /**
     The duration of the reporting period
     */
    public enum Period: String, ParameterValue, Codable, CaseIterable {
        case P7D
        case P30D
        case P90D
        case P365D
    }
}
