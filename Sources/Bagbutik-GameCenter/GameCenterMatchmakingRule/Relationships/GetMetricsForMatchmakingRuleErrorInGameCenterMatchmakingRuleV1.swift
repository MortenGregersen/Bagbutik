import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get matchmaking rule errors
     Get errors that occur for a specific matchmaking rule.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_matchmaking_rule_errors>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter sorts: Attributes by which to sort
     - Parameter granularity: The granularity of the per-group dataset
     - Parameter groupBy: The dimension by which to group the results
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForMatchmakingRuleErrorInGameCenterMatchmakingRuleV1(id: String,
                                                                               filters: [GetMetricsForMatchmakingRuleErrorInGameCenterMatchmakingRuleV1.Filter]? = nil,
                                                                               sorts: [GetMetricsForMatchmakingRuleErrorInGameCenterMatchmakingRuleV1.Sort]? = nil,
                                                                               granularity: GetMetricsForMatchmakingRuleErrorInGameCenterMatchmakingRuleV1.Granularity? = nil,
                                                                               groupBy: GetMetricsForMatchmakingRuleErrorInGameCenterMatchmakingRuleV1.GroupBy? = nil,
                                                                               limit: Int? = nil) -> Request<GameCenterMatchmakingRuleErrorsV1MetricResponse, ErrorResponse>
    {
        var customs = [String: String]()
        if let granularity { customs["granularity"] = granularity.rawValue }
        if let groupBy { customs["groupBy"] = groupBy.rawValue }
        return .init(path: "/v1/gameCenterMatchmakingRules/\(id)/metrics/matchmakingRuleErrors", method: .get, parameters: .init(filters: filters,
                                                                                                                                 sorts: sorts,
                                                                                                                                 limit: limit,
                                                                                                                                 customs: customs))
    }
}

public enum GetMetricsForMatchmakingRuleErrorInGameCenterMatchmakingRuleV1 {
    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by 'gameCenterMatchmakingQueue' relationship dimension
        case gameCenterMatchmakingQueue([String])
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
    public enum Granularity: String, ParameterValue, Codable, CaseIterable {
        case P1D
        case PT1H
        case PT15M
    }

    /**
     The dimension by which to group the results
     */
    public enum GroupBy: String, ParameterValue, Codable, CaseIterable {
        case gameCenterMatchmakingQueue
    }
}
