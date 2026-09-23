import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Get Queue Size

     Get the time that match requests are in a specific queue.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/02a62ecf-addf-48dc-a483-db6db43c574c/metrics/matchmakingQueueSizes?granularity=PT15M/gameCenterMatchmakingQueues/532ad9c0-1a28-4536-ad57-33213bcc0a29/metrics/
     ```

     **Response:**

     ```json
     {
       “data”: [
         {
           “type”: “gameCenterMatchmakingQueueSizes”,
           “dataPoints”: [
             {
               “start”: “2023-10-07T02:15:00Z”,
               “end”: “2023-10-07T02:30:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-07T02:00:00Z”,
               “end”: “2023-10-07T02:15:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-07T01:45:00Z”,
               “end”: “2023-10-07T02:00:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.01010101010101,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-07T01:30:00Z”,
               “end”: “2023-10-07T01:45:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-07T01:15:00Z”,
               “end”: “2023-10-07T01:30:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.0202020202020203,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-07T01:00:00Z”,
               “end”: “2023-10-07T01:15:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-07T00:45:00Z”,
               “end”: “2023-10-07T01:00:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.01010101010101,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-07T00:30:00Z”,
               “end”: “2023-10-07T00:45:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-07T00:15:00Z”,
               “end”: “2023-10-07T00:30:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.01010101010101,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-07T00:00:00Z”,
               “end”: “2023-10-07T00:15:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T23:45:00Z”,
               “end”: “2023-10-07T00:00:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.0202020202020203,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-06T23:30:00Z”,
               “end”: “2023-10-06T23:45:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T23:15:00Z”,
               “end”: “2023-10-06T23:30:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 1.99,
                 “p95NumberOfRequests”: 2,
                 “count”: 100
               }
             },
             {
               “start”: “2023-10-06T23:00:00Z”,
               “end”: “2023-10-06T23:15:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T22:45:00Z”,
               “end”: “2023-10-06T23:00:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.01010101010101,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-06T22:30:00Z”,
               “end”: “2023-10-06T22:45:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T22:15:00Z”,
               “end”: “2023-10-06T22:30:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.01010101010101,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-06T22:00:00Z”,
               “end”: “2023-10-06T22:15:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T21:45:00Z”,
               “end”: “2023-10-06T22:00:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.01010101010101,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-06T21:30:00Z”,
               “end”: “2023-10-06T21:45:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T21:15:00Z”,
               “end”: “2023-10-06T21:30:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.020408163265306,
                 “p95NumberOfRequests”: 2,
                 “count”: 98
               }
             },
             {
               “start”: “2023-10-06T21:00:00Z”,
               “end”: “2023-10-06T21:15:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T20:45:00Z”,
               “end”: “2023-10-06T21:00:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.01010101010101,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-06T20:30:00Z”,
               “end”: “2023-10-06T20:45:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T20:15:00Z”,
               “end”: “2023-10-06T20:30:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.020408163265306,
                 “p95NumberOfRequests”: 2,
                 “count”: 98
               }
             },
             {
               “start”: “2023-10-06T20:00:00Z”,
               “end”: “2023-10-06T20:15:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T19:45:00Z”,
               “end”: “2023-10-06T20:00:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.0202020202020203,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-06T19:30:00Z”,
               “end”: “2023-10-06T19:45:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T19:15:00Z”,
               “end”: “2023-10-06T19:30:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2,
                 “p95NumberOfRequests”: 2,
                 “count”: 99
               }
             },
             {
               “start”: “2023-10-06T19:00:00Z”,
               “end”: “2023-10-06T19:15:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             },
             {
               “start”: “2023-10-06T18:45:00Z”,
               “end”: “2023-10-06T19:00:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 2,
                 “averageNumberOfRequests”: 2.020408163265306,
                 “p95NumberOfRequests”: 2,
                 “count”: 98
               }
             },
             {
               “start”: “2023-10-06T18:30:00Z”,
               “end”: “2023-10-06T18:45:00Z”,
               “values”: {
                 “p50NumberOfRequests”: 0,
                 “averageNumberOfRequests”: 0,
                 “p95NumberOfRequests”: 0,
                 “count”: 0
               }
             }
           ],
           “granularity”: 900
         }
       ],
       “links”: {
         “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/02a62ecf-addf-48dc-a483-db6db43c574c/metrics/matchmakingQueueSizes?granularity=PT15M”
       },
       “meta”: {
         “paging”: {
           “total”: 1,
           “limit”: 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingQueues-_id_-metrics-matchmakingQueueSizes>

     - Parameter id: The id of the requested resource
     - Parameter sorts: Attributes by which to sort
     - Parameter granularity: The granularity of the per-group dataset
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForMatchmakingQueueSizeInGameCenterMatchmakingQueueV1(id: String,
                                                                                sorts: [GetMetricsForMatchmakingQueueSizeInGameCenterMatchmakingQueueV1.Sort]? = nil,
                                                                                granularity: GetMetricsForMatchmakingQueueSizeInGameCenterMatchmakingQueueV1.Granularity? = nil,
                                                                                limit: Int? = nil) -> Request<GameCenterMatchmakingQueueSizesV1MetricResponse, ErrorResponse> {
        var customs = [String: String]()
        if let granularity { customs["granularity"] = granularity.rawValue }
        return .init(
            path: "/v1/gameCenterMatchmakingQueues/\(id)/metrics/matchmakingQueueSizes",
            method: .get,
            parameters: .init(
                sorts: sorts,
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
