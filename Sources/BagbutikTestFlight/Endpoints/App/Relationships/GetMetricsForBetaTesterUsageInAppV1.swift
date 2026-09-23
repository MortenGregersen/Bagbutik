import BagbutikCore
import BagbutikModelsShared
import BagbutikTestFlightModels

public extension Request {
    /**
     # Read Beta Tester Metrics for an App

     Get usage metrics for beta testers of a specific app.

     ## Discussion

     > Tip:
     > This endpoint requires either `groupBy` or `filter[betaTesters]` parameter.

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6447306070/metrics/betaTesterUsages?period=P365D&limit=5&groupBy=betaTesters
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appsBetaTesterUsages",
         "dataPoints" : [ {
           "start" : "2022-10-05",
           "end" : "2023-10-05",
           "values" : {
             "crashCount" : 0,
             "sessionCount" : 21,
             "feedbackCount" : 1
           }
         } ],
         "dimensions" : {
           "betaTesters" : {
             "data" : {
               "type" : "betaTesters",
               "id" : "8fa019c6-a92a-4563-ab06-577daa03c5d1"
             },
             "links" : {
               "related" : "https://api.appstoreconnect.apple.com/v1/betaTesters/8fa019c6-a92a-4563-ab06-577daa03c5d1",
               "groupBy" : "https://api.appstoreconnect.apple.com/v1/apps/6447306070/metrics/betaTesterUsages?groupBy=betaTesters"
             }
           }
         }
       }, {
         "type" : "appsBetaTesterUsages",
         "dataPoints" : [ {
           "start" : "2022-10-05",
           "end" : "2023-10-05",
           "values" : {
             "crashCount" : 5,
             "sessionCount" : 5,
             "feedbackCount" : 0
           }
         } ],
         "dimensions" : {
           "betaTesters" : {
             "data" : {
               "type" : "betaTesters",
               "id" : "98a05411-af84-40bf-919a-dc32c75e9e32"
             },
             "links" : {
               "related" : "https://api.appstoreconnect.apple.com/v1/betaTesters/98a05411-af84-40bf-919a-dc32c75e9e32",
               "groupBy" : "https://api.appstoreconnect.apple.com/v1/apps/6447306070/metrics/betaTesterUsages?groupBy=betaTesters"
             }
           }
         }
       }, {
         "type" : "appsBetaTesterUsages",
         "dataPoints" : [ {
           "start" : "2022-10-05",
           "end" : "2023-10-05",
           "values" : {
             "crashCount" : 1,
             "sessionCount" : 2,
             "feedbackCount" : 1
           }
         } ],
         "dimensions" : {
           "betaTesters" : {
             "data" : {
               "type" : "betaTesters",
               "id" : "993a21fd-980c-4ae3-9767-0eb50095f70e"
             },
             "links" : {
               "related" : "https://api.appstoreconnect.apple.com/v1/betaTesters/993a21fd-980c-4ae3-9767-0eb50095f70e",
               "groupBy" : "https://api.appstoreconnect.apple.com/v1/apps/6447306070/metrics/betaTesterUsages?groupBy=betaTesters"
             }
           }
         }
       }, {
         "type" : "appsBetaTesterUsages",
         "dataPoints" : [ {
           "start" : "2022-10-05",
           "end" : "2023-10-05",
           "values" : {
             "crashCount" : 4,
             "sessionCount" : 16,
             "feedbackCount" : 4
           }
         } ],
         "dimensions" : {
           "betaTesters" : {
             "data" : {
               "type" : "betaTesters",
               "id" : "9988d713-a315-45ae-9147-1fe119b9eea9"
             },
             "links" : {
               "related" : "https://api.appstoreconnect.apple.com/v1/betaTesters/9988d713-a315-45ae-9147-1fe119b9eea9",
               "groupBy" : "https://api.appstoreconnect.apple.com/v1/apps/6447306070/metrics/betaTesterUsages?groupBy=betaTesters"
             }
           }
         }
       }, {
         "type" : "appsBetaTesterUsages",
         "dataPoints" : [ {
           "start" : "2022-10-05",
           "end" : "2023-10-05",
           "values" : {
             "crashCount" : 0,
             "sessionCount" : 200,
             "feedbackCount" : 10
           }
         } ],
         "dimensions" : {
           "betaTesters" : {
             "data" : {
               "type" : "betaTesters",
               "id" : "99e5ee74-39c3-4f52-86be-041c0fee2c6f"
             },
             "links" : {
               "related" : "https://api.appstoreconnect.apple.com/v1/betaTesters/99e5ee74-39c3-4f52-86be-041c0fee2c6f",
               "groupBy" : "https://api.appstoreconnect.apple.com/v1/apps/6447306070/metrics/betaTesterUsages?groupBy=betaTesters"
             }
           }
         }
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/apps/6447306070/metrics/betaTesterUsages?period=PT8760H&limit=5&groupBy=betaTesters",
         "next" : "https://api.appstoreconnect.apple.com/v1/apps/6447306070/metrics/betaTesterUsages?cursor=BQ.TGQPUQ&period=PT8760H&limit=5&groupBy=betaTesters"
       },
       "meta" : {
         "paging" : {
           "total" : 931,
           "limit" : 5
         }
       }
     }
     ```

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/6448250830/metrics/betaTesterUsages?filter%5BbetaTesters%5D=cd082742-b2ec-4e63-b63f-6732f3e7abdd
     ```

     **Response:**

     ```json
     {
       “data”: [
         {
           “type”: “appsBetaTesterUsages”,
           “dataPoints”: [
             {
               “start”: “2022-10-05”,
               “end”: “2023-10-05”,
               “values”: {
                 “crashCount”: 4,
                 “sessionCount”: 16,
                 “feedbackCount”: 0
               }
             }
           ],
           “dimensions”: {
             “betaTesters”: {
               “data”: {
                 “type”: “betaTesters”,
                 “id”: “cd082742-b2ec-4e63-b63f-6732f3e7abdd”
               },
               “links”: {
                 “related”: “https://api.appstoreconnect.apple.com/v1/betaTesters/cd082742-b2ec-4e63-b63f-6732f3e7abdd”,
                 “groupBy”: “https://api.appstoreconnect.apple.com/v1/apps/6448250830/metrics/betaTesterUsages?groupBy=betaTesters”
               }
             }
           }
         }
       ],
       “links”: {
         “self”: “https://api.appstoreconnect.apple.com/v1/apps/6448250830/metrics/betaTesterUsages?filter%5BbetaTesters%5D=cd082742-b2ec-4e63-b63f-6732f3e7abdd”
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
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-metrics-betaTesterUsages>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter groupBy: The dimension by which to group the results
     - Parameter period: The duration of the reporting period
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForBetaTesterUsageInAppV1(id: String,
                                                    filters: [GetMetricsForBetaTesterUsageInAppV1.Filter]? = nil,
                                                    groupBy: GetMetricsForBetaTesterUsageInAppV1.GroupBy? = nil,
                                                    period: GetMetricsForBetaTesterUsageInAppV1.Period? = nil,
                                                    limit: Int? = nil) -> Request<AppsBetaTesterUsagesV1MetricResponse, ErrorResponse> {
        var customs = [String: String]()
        if let groupBy { customs["groupBy"] = groupBy.rawValue }
        if let period { customs["period"] = period.rawValue }
        return .init(
            path: "/v1/apps/\(id)/metrics/betaTesterUsages",
            method: .get,
            parameters: .init(
                filters: filters,
                limit: limit,
                customs: customs))
    }
}

public enum GetMetricsForBetaTesterUsageInAppV1 {
    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by 'betaTesters' relationship dimension
        case betaTesters([String])
    }

    /**
     The dimension by which to group the results
     */
    public enum GroupBy: String, Sendable, ParameterValue, Codable, CaseIterable {
        case betaTesters

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

    /**
     The duration of the reporting period
     */
    public enum Period: String, Sendable, ParameterValue, Codable, CaseIterable {
        case P30D
        case P365D
        case P7D
        case P90D

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            if let value = Period(rawValue: string) {
                self = value
            } else if let value = Period(rawValue: string.uppercased()) {
                self = value
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid Period value: \(string)"
                )
            }
        }
    }
}
