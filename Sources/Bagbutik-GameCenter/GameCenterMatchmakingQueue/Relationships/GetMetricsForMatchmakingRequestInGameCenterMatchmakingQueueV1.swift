import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get match request time in queue
     Get the match requests that a specific queue processes.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_match_request_time_in_queue>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter sorts: Attributes by which to sort
     - Parameter granularity: The granularity of the per-group dataset
     - Parameter groupBy: The dimension by which to group the results
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForMatchmakingRequestInGameCenterMatchmakingQueueV1(id: String,
                                                                              filters: [GetMetricsForMatchmakingRequestInGameCenterMatchmakingQueueV1.Filter]? = nil,
                                                                              sorts: [GetMetricsForMatchmakingRequestInGameCenterMatchmakingQueueV1.Sort]? = nil,
                                                                              granularity: GetMetricsForMatchmakingRequestInGameCenterMatchmakingQueueV1.Granularity? = nil,
                                                                              groupBy: GetMetricsForMatchmakingRequestInGameCenterMatchmakingQueueV1.GroupBy? = nil,
                                                                              limit: Int? = nil) -> Request<GameCenterMatchmakingQueueRequestsV1MetricResponse, ErrorResponse>
    {
        var customs = [String: String]()
        if let granularity { customs["granularity"] = granularity.rawValue }
        if let groupBy { customs["groupBy"] = groupBy.rawValue }
        return .init(path: "/v1/gameCenterMatchmakingQueues/\(id)/metrics/matchmakingRequests", method: .get, parameters: .init(filters: filters,
                                                                                                                                sorts: sorts,
                                                                                                                                limit: limit,
                                                                                                                                customs: customs))
    }
}

public enum GetMetricsForMatchmakingRequestInGameCenterMatchmakingQueueV1 {
    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by 'gameCenterDetail' relationship dimension
        case gameCenterDetail([String])
        /// Filter by 'result' attribute dimension
        case result([String])
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case averageSecondsInQueueAscending = "averageSecondsInQueue"
        case averageSecondsInQueueDescending = "-averageSecondsInQueue"
        case countAscending = "count"
        case countDescending = "-count"
        case p50SecondsInQueueAscending = "p50SecondsInQueue"
        case p50SecondsInQueueDescending = "-p50SecondsInQueue"
        case p95SecondsInQueueAscending = "p95SecondsInQueue"
        case p95SecondsInQueueDescending = "-p95SecondsInQueue"
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
        case gameCenterDetail
        case result
    }
}
