import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get Boolean rule results
     Get the results of a specific matchmaking rule that returns Boolean values.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingRules-_id_-metrics-matchmakingBooleanRuleResults>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter sorts: Attributes by which to sort
     - Parameter granularity: The granularity of the per-group dataset
     - Parameter groupBy: The dimension by which to group the results
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForMatchmakingBooleanRuleResultInGameCenterMatchmakingRuleV1(id: String,
                                                                                       filters: [GetMetricsForMatchmakingBooleanRuleResultInGameCenterMatchmakingRuleV1.Filter]? = nil,
                                                                                       sorts: [GetMetricsForMatchmakingBooleanRuleResultInGameCenterMatchmakingRuleV1.Sort]? = nil,
                                                                                       granularity: GetMetricsForMatchmakingBooleanRuleResultInGameCenterMatchmakingRuleV1.Granularity? = nil,
                                                                                       groupBy: GetMetricsForMatchmakingBooleanRuleResultInGameCenterMatchmakingRuleV1.GroupBy? = nil,
                                                                                       limit: Int? = nil) -> Request<GameCenterMatchmakingBooleanRuleResultsV1MetricResponse, ErrorResponse>
    {
        var customs = [String: String]()
        if let granularity { customs["granularity"] = granularity.rawValue }
        if let groupBy { customs["groupBy"] = groupBy.rawValue }
        return .init(path: "/v1/gameCenterMatchmakingRules/\(id)/metrics/matchmakingBooleanRuleResults", method: .get, parameters: .init(filters: filters,
                                                                                                                                         sorts: sorts,
                                                                                                                                         limit: limit,
                                                                                                                                         customs: customs))
    }
}

public enum GetMetricsForMatchmakingBooleanRuleResultInGameCenterMatchmakingRuleV1 {
    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by 'gameCenterMatchmakingQueue' relationship dimension
        case gameCenterMatchmakingQueue([String])
        /// Filter by 'result' attribute dimension
        case result([String])
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case countAscending = "count"
        case countDescending = "-count"
    }

    /**
     The granularity of the per-group dataset
     */
    public enum Granularity: String, Sendable, ParameterValue, Codable, CaseIterable {
        case P1D
        case PT15M
        case PT1H
    }

    /**
     The dimension by which to group the results
     */
    public enum GroupBy: String, Sendable, ParameterValue, Codable, CaseIterable {
        case gameCenterMatchmakingQueue
        case result
    }
}
