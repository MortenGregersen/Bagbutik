import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get experimental match request time in queue
     Get the match requests that a specific queue processes using its experimental rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_experimental_match_request_time_in_queue>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter sorts: Attributes by which to sort
     - Parameter granularity: The granularity of the per-group dataset
     - Parameter groupBy: The dimension by which to group the results
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForExperimentMatchmakingRequestInGameCenterMatchmakingQueueV1(id: String,
                                                                                        filters: [GetMetricsForExperimentMatchmakingRequestInGameCenterMatchmakingQueueV1.Filter]? = nil,
                                                                                        sorts: [GetMetricsForExperimentMatchmakingRequestInGameCenterMatchmakingQueueV1.Sort]? = nil,
                                                                                        granularity: GetMetricsForExperimentMatchmakingRequestInGameCenterMatchmakingQueueV1.Granularity? = nil,
                                                                                        groupBy: GetMetricsForExperimentMatchmakingRequestInGameCenterMatchmakingQueueV1.GroupBy? = nil,
                                                                                        limit: Int? = nil) -> Request<GameCenterMatchmakingQueueRequestsV1MetricResponse, ErrorResponse>
    {
        var customs = [String: String]()
        if let granularity { customs["granularity"] = granularity.rawValue }
        if let groupBy { customs["groupBy"] = groupBy.rawValue }
        return .init(path: "/v1/gameCenterMatchmakingQueues/\(id)/metrics/experimentMatchmakingRequests", method: .get, parameters: .init(filters: filters,
                                                                                                                                          sorts: sorts,
                                                                                                                                          limit: limit,
                                                                                                                                          customs: customs))
    }
}

public enum GetMetricsForExperimentMatchmakingRequestInGameCenterMatchmakingQueueV1 {
    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by 'gameCenterDetail' relationship dimension
        case gameCenterDetail([String])
        /// Filter by 'result' attribute dimension
        case result([Result])

        public enum Result: String, Sendable, ParameterValue, Codable, CaseIterable {
            case canceled = "CANCELED"
            case expired = "EXPIRED"
            case matched = "MATCHED"
        }
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
    public enum Granularity: String, Sendable, ParameterValue, Codable, CaseIterable {
        case P1D
        case PT15M
        case PT1H
    }

    /**
     The dimension by which to group the results
     */
    public enum GroupBy: String, Sendable, ParameterValue, Codable, CaseIterable {
        case gameCenterDetail
        case result
    }
}
