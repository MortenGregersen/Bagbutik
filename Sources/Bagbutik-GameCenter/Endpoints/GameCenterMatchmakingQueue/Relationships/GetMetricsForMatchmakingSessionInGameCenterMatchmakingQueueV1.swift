import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get queue session information
     Get session information on a queue.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingQueues-_id_-metrics-matchmakingSessions>

     - Parameter id: The id of the requested resource
     - Parameter sorts: Attributes by which to sort
     - Parameter granularity: The granularity of the per-group dataset
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForMatchmakingSessionInGameCenterMatchmakingQueueV1(id: String,
                                                                              sorts: [GetMetricsForMatchmakingSessionInGameCenterMatchmakingQueueV1.Sort]? = nil,
                                                                              granularity: GetMetricsForMatchmakingSessionInGameCenterMatchmakingQueueV1.Granularity? = nil,
                                                                              limit: Int? = nil) -> Request<GameCenterMatchmakingSessionsV1MetricResponse, ErrorResponse> {
        var customs = [String: String]()
        if let granularity { customs["granularity"] = granularity.rawValue }
        return .init(
            path: "/v1/gameCenterMatchmakingQueues/\(id)/metrics/matchmakingSessions",
            method: .get,
            parameters: .init(
                sorts: sorts,
                limit: limit,
                customs: customs))
    }
}

public enum GetMetricsForMatchmakingSessionInGameCenterMatchmakingQueueV1 {
    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case averagePlayerCountAscending = "averagePlayerCount"
        case averagePlayerCountDescending = "-averagePlayerCount"
        case countAscending = "count"
        case countDescending = "-count"
        case p50PlayerCountAscending = "p50PlayerCount"
        case p50PlayerCountDescending = "-p50PlayerCount"
        case p95PlayerCountAscending = "p95PlayerCount"
        case p95PlayerCountDescending = "-p95PlayerCount"
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
