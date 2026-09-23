import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get Queue Session Information

     Get session information on a queue.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/0df9ae63-0328-4060-9afc-53e848e8c386/metrics/matchmakingSessions?granularity=PT15M
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "gameCenterMatchmakingSessions",
           "dataPoints": [
             {
               "start": "2023-10-10T23:30:00Z",
               "end": "2023-10-10T23:45:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T23:15:00Z",
               "end": "2023-10-10T23:30:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T23:00:00Z",
               "end": "2023-10-10T23:15:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T22:45:00Z",
               "end": "2023-10-10T23:00:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T22:30:00Z",
               "end": "2023-10-10T22:45:00Z",
               "values": {
                 "count": 1,
                 "p50PlayerCount": 2,
                 "averagePlayerCount": 2,
                 "p95PlayerCount": 2
               }
             },
             {
               "start": "2023-10-10T22:15:00Z",
               "end": "2023-10-10T22:30:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T22:00:00Z",
               "end": "2023-10-10T22:15:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T21:45:00Z",
               "end": "2023-10-10T22:00:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T21:30:00Z",
               "end": "2023-10-10T21:45:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T21:15:00Z",
               "end": "2023-10-10T21:30:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T21:00:00Z",
               "end": "2023-10-10T21:15:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T20:45:00Z",
               "end": "2023-10-10T21:00:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T20:30:00Z",
               "end": "2023-10-10T20:45:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T20:15:00Z",
               "end": "2023-10-10T20:30:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T20:00:00Z",
               "end": "2023-10-10T20:15:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T19:45:00Z",
               "end": "2023-10-10T20:00:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T19:30:00Z",
               "end": "2023-10-10T19:45:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T19:15:00Z",
               "end": "2023-10-10T19:30:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T19:00:00Z",
               "end": "2023-10-10T19:15:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T18:45:00Z",
               "end": "2023-10-10T19:00:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T18:30:00Z",
               "end": "2023-10-10T18:45:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T18:15:00Z",
               "end": "2023-10-10T18:30:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T18:00:00Z",
               "end": "2023-10-10T18:15:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T17:45:00Z",
               "end": "2023-10-10T18:00:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T17:30:00Z",
               "end": "2023-10-10T17:45:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T17:15:00Z",
               "end": "2023-10-10T17:30:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T17:00:00Z",
               "end": "2023-10-10T17:15:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T16:45:00Z",
               "end": "2023-10-10T17:00:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T16:30:00Z",
               "end": "2023-10-10T16:45:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T16:15:00Z",
               "end": "2023-10-10T16:30:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T16:00:00Z",
               "end": "2023-10-10T16:15:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             },
             {
               "start": "2023-10-10T15:45:00Z",
               "end": "2023-10-10T16:00:00Z",
               "values": {
                 "count": 0,
                 "p50PlayerCount": 0,
                 "averagePlayerCount": 0,
                 "p95PlayerCount": 0
               }
             }
           ],
           "granularity": 900
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/0df9ae63-0328-4060-9afc-53e848e8c386/metrics/matchmakingSessions?granularity=PT15M"
       },
       "meta": {
         "paging": {
           "total": 1,
           "limit": 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
