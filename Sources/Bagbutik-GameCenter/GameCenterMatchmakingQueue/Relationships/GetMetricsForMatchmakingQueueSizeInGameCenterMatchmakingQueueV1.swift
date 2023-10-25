import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get queue size
     Get the time that match requests are in a specific queue.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get_queue_size>

     - Parameter id: The id of the requested resource
     - Parameter sorts: Attributes by which to sort
     - Parameter granularity: The granularity of the per-group dataset
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForMatchmakingQueueSizeInGameCenterMatchmakingQueueV1(id: String,
                                                                                sorts: [GetMetricsForMatchmakingQueueSizeInGameCenterMatchmakingQueueV1.Sort]? = nil,
                                                                                granularity: GetMetricsForMatchmakingQueueSizeInGameCenterMatchmakingQueueV1.Granularity? = nil,
                                                                                limit: Int? = nil) -> Request<GameCenterMatchmakingQueueSizesV1MetricResponse, ErrorResponse>
    {
        var customs = [String: String]()
        if let granularity { customs["granularity"] = granularity.rawValue }
        return .init(path: "/v1/gameCenterMatchmakingQueues/\(id)/metrics/matchmakingQueueSizes", method: .get, parameters: .init(sorts: sorts,
                                                                                                                                  limit: limit,
                                                                                                                                  customs: customs))
    }
}

public enum GetMetricsForMatchmakingQueueSizeInGameCenterMatchmakingQueueV1 {
    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case averageNumberOfRequestsAscending = "averageNumberOfRequests"
        case averageNumberOfRequestsDescending = "-averageNumberOfRequests"
        case countAscending = "count"
        case countDescending = "-count"
        case p50NumberOfRequestsAscending = "p50NumberOfRequests"
        case p50NumberOfRequestsDescending = "-p50NumberOfRequests"
        case p95NumberOfRequestsAscending = "p95NumberOfRequests"
        case p95NumberOfRequestsDescending = "-p95NumberOfRequests"
    }

    /**
     The granularity of the per-group dataset
     */
    public enum Granularity: String, ParameterValue, Codable, CaseIterable {
        case P1D
        case PT1H
        case PT15M
    }
}
