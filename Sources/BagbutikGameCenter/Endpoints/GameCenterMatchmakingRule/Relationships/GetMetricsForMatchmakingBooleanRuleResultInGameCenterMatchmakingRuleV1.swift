import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Get boolean rule results

     Get the results of a specific matchmaking rule that returns Boolean values.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?granularity=PT15M&groupBy=result
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "gameCenterMatchmakingBooleanRuleResults",
           "dataPoints": [
             {
               "start": "2023-10-07T02:15:00Z",
               "end": "2023-10-07T02:30:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-07T02:00:00Z",
               "end": "2023-10-07T02:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-07T01:45:00Z",
               "end": "2023-10-07T02:00:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-07T01:30:00Z",
               "end": "2023-10-07T01:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-07T01:15:00Z",
               "end": "2023-10-07T01:30:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-07T01:00:00Z",
               "end": "2023-10-07T01:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-07T00:45:00Z",
               "end": "2023-10-07T01:00:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-07T00:30:00Z",
               "end": "2023-10-07T00:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-07T00:15:00Z",
               "end": "2023-10-07T00:30:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-07T00:00:00Z",
               "end": "2023-10-07T00:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T23:45:00Z",
               "end": "2023-10-07T00:00:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T23:30:00Z",
               "end": "2023-10-06T23:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T23:15:00Z",
               "end": "2023-10-06T23:30:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T23:00:00Z",
               "end": "2023-10-06T23:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T22:45:00Z",
               "end": "2023-10-06T23:00:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T22:30:00Z",
               "end": "2023-10-06T22:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T22:15:00Z",
               "end": "2023-10-06T22:30:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T22:00:00Z",
               "end": "2023-10-06T22:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T21:45:00Z",
               "end": "2023-10-06T22:00:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T21:30:00Z",
               "end": "2023-10-06T21:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T21:15:00Z",
               "end": "2023-10-06T21:30:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T21:00:00Z",
               "end": "2023-10-06T21:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T20:45:00Z",
               "end": "2023-10-06T21:00:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T20:30:00Z",
               "end": "2023-10-06T20:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T20:15:00Z",
               "end": "2023-10-06T20:30:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T20:00:00Z",
               "end": "2023-10-06T20:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T19:45:00Z",
               "end": "2023-10-06T20:00:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T19:30:00Z",
               "end": "2023-10-06T19:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T19:15:00Z",
               "end": "2023-10-06T19:30:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T19:00:00Z",
               "end": "2023-10-06T19:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T18:45:00Z",
               "end": "2023-10-06T19:00:00Z",
               "values": {
                 "count": 14
               }
             },
             {
               "start": "2023-10-06T18:30:00Z",
               "end": "2023-10-06T18:45:00Z",
               "values": {
                 "count": 0
               }
             }
           ],
           "dimensions": {
             "result": {
               "data": true,
               "links": {
                 "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?groupBy=result"
               }
             },
             "gameCenterMatchmakingQueue": {
               "links": {
                 "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?groupBy=gameCenterMatchmakingQueue"
               }
             }
           },
           "granularity": 900
         },
         {
           "type": "gameCenterMatchmakingBooleanRuleResults",
           "dataPoints": [
             {
               "start": "2023-10-07T02:15:00Z",
               "end": "2023-10-07T02:30:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-07T02:00:00Z",
               "end": "2023-10-07T02:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-07T01:45:00Z",
               "end": "2023-10-07T02:00:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-07T01:30:00Z",
               "end": "2023-10-07T01:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-07T01:15:00Z",
               "end": "2023-10-07T01:30:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-07T01:00:00Z",
               "end": "2023-10-07T01:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-07T00:45:00Z",
               "end": "2023-10-07T01:00:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-07T00:30:00Z",
               "end": "2023-10-07T00:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-07T00:15:00Z",
               "end": "2023-10-07T00:30:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-07T00:00:00Z",
               "end": "2023-10-07T00:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T23:45:00Z",
               "end": "2023-10-07T00:00:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T23:30:00Z",
               "end": "2023-10-06T23:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T23:15:00Z",
               "end": "2023-10-06T23:30:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T23:00:00Z",
               "end": "2023-10-06T23:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T22:45:00Z",
               "end": "2023-10-06T23:00:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T22:30:00Z",
               "end": "2023-10-06T22:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T22:15:00Z",
               "end": "2023-10-06T22:30:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T22:00:00Z",
               "end": "2023-10-06T22:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T21:45:00Z",
               "end": "2023-10-06T22:00:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T21:30:00Z",
               "end": "2023-10-06T21:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T21:15:00Z",
               "end": "2023-10-06T21:30:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T21:00:00Z",
               "end": "2023-10-06T21:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T20:45:00Z",
               "end": "2023-10-06T21:00:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T20:30:00Z",
               "end": "2023-10-06T20:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T20:15:00Z",
               "end": "2023-10-06T20:30:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T20:00:00Z",
               "end": "2023-10-06T20:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T19:45:00Z",
               "end": "2023-10-06T20:00:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T19:30:00Z",
               "end": "2023-10-06T19:45:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T19:15:00Z",
               "end": "2023-10-06T19:30:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T19:00:00Z",
               "end": "2023-10-06T19:15:00Z",
               "values": {
                 "count": 0
               }
             },
             {
               "start": "2023-10-06T18:45:00Z",
               "end": "2023-10-06T19:00:00Z",
               "values": {
                 "count": 4
               }
             },
             {
               "start": "2023-10-06T18:30:00Z",
               "end": "2023-10-06T18:45:00Z",
               "values": {
                 "count": 0
               }
             }
           ],
           "dimensions": {
             "result": {
               "data": false,
               "links": {
                 "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?groupBy=result"
               }
             },
             "gameCenterMatchmakingQueue": {
               "links": {
                 "groupBy": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?groupBy=gameCenterMatchmakingQueue"
               }
             }
           },
           "granularity": 900
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/0f0fcbf9-43b6-429d-8c08-fcaf66a52872/metrics/matchmakingBooleanRuleResults?granularity=PT15M&groupBy=result"
       },
       "meta": {
         "paging": {
           "total": 2,
           "limit": 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
                                                                                       limit: Int? = nil) -> Request<GameCenterMatchmakingBooleanRuleResultsV1MetricResponse, ErrorResponse> {
        var customs = [String: String]()
        if let granularity { customs["granularity"] = granularity.rawValue }
        if let groupBy { customs["groupBy"] = groupBy.rawValue }
        return .init(
            path: "/v1/gameCenterMatchmakingRules/\(id)/metrics/matchmakingBooleanRuleResults",
            method: .get,
            parameters: .init(
                filters: filters,
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

    /**
     The dimension by which to group the results
     */
    public enum GroupBy: String, Sendable, ParameterValue, Codable, CaseIterable {
        case gameCenterMatchmakingQueue
        case result

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let value = GroupBy(rawValue: string) {
                self = value
            } else if let value = GroupBy(rawValue: string.uppercased()) {
                self = value
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid GroupBy value: \(string)"
                )
            }
        }
    }
}
