import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get numeric rule results
     Get the results of a specific matchmaking rule that returns numeric values.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingRules-_id_-metrics-matchmakingNumberRuleResults>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter sorts: Attributes by which to sort
     - Parameter granularity: The granularity of the per-group dataset
     - Parameter groupBy: The dimension by which to group the results
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForMatchmakingNumberRuleResultInGameCenterMatchmakingRuleV1(id: String,
                                                                                      filters: [GetMetricsForMatchmakingNumberRuleResultInGameCenterMatchmakingRuleV1.Filter]? = nil,
                                                                                      sorts: [GetMetricsForMatchmakingNumberRuleResultInGameCenterMatchmakingRuleV1.Sort]? = nil,
                                                                                      granularity: GetMetricsForMatchmakingNumberRuleResultInGameCenterMatchmakingRuleV1.Granularity? = nil,
                                                                                      groupBy: GetMetricsForMatchmakingNumberRuleResultInGameCenterMatchmakingRuleV1.GroupBy? = nil,
                                                                                      limit: Int? = nil) -> Request<GameCenterMatchmakingNumberRuleResultsV1MetricResponse, ErrorResponse> {
        var customs = [String: String]()
        if let granularity { customs["granularity"] = granularity.rawValue }
        if let groupBy { customs["groupBy"] = groupBy.rawValue }
        return .init(
            path: "/v1/gameCenterMatchmakingRules/\(id)/metrics/matchmakingNumberRuleResults",
            method: .get,
            parameters: .init(
                filters: filters,
                sorts: sorts,
                limit: limit,
                customs: customs))
    }
}

public enum GetMetricsForMatchmakingNumberRuleResultInGameCenterMatchmakingRuleV1 {
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
        case averageResultAscending = "averageResult"
        case averageResultDescending = "-averageResult"
        case countAscending = "count"
        case countDescending = "-count"
        case p50ResultAscending = "p50Result"
        case p50ResultDescending = "-p50Result"
        case p95ResultAscending = "p95Result"
        case p95ResultDescending = "-p95Result"
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
    }
}
