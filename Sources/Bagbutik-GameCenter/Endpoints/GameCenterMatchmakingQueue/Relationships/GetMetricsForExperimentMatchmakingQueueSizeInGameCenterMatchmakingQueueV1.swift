import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get experimental queue size
     Get the number of match requests that the queue processes using its experimental rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingQueues-_id_-metrics-experimentMatchmakingQueueSizes>

     - Parameter id: The id of the requested resource
     - Parameter sorts: Attributes by which to sort
     - Parameter granularity: The granularity of the per-group dataset
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForExperimentMatchmakingQueueSizeInGameCenterMatchmakingQueueV1(id: String,
                                                                                          sorts: [GetMetricsForExperimentMatchmakingQueueSizeInGameCenterMatchmakingQueueV1.Sort]? = nil,
                                                                                          granularity: GetMetricsForExperimentMatchmakingQueueSizeInGameCenterMatchmakingQueueV1.Granularity? = nil,
                                                                                          limit: Int? = nil) -> Request<GameCenterMatchmakingQueueSizesV1MetricResponse, ErrorResponse> {
        var customs = [String: String]()
        if let granularity { customs["granularity"] = granularity.rawValue }
        return .init(
            path: "/v1/gameCenterMatchmakingQueues/\(id)/metrics/experimentMatchmakingQueueSizes",
            method: .get,
            parameters: .init(
                sorts: sorts,
                limit: limit,
                customs: customs))
    }
}

public enum GetMetricsForExperimentMatchmakingQueueSizeInGameCenterMatchmakingQueueV1 {
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
    public enum Granularity: String, Sendable, ParameterValue, Codable, CaseIterable {
        case P1D
        case PT15M
        case PT1H

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let value = Granularity(rawValue: string) {
                self = value
            } else if let value = Granularity(rawValue: string.uppercased()) {
                self = value
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid Granularity value: \(string)"
                )
            }
        }
    }
}
