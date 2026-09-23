import BagbutikCore
import BagbutikModelsShared
import BagbutikTestFlightModels

public extension Request {
    /**
     # Read Beta Tester Usage Metrics

     Get usage metrics for a specific beta tester.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/betaTesters/1aa1fe09-bb5c-47dd-a067-a6066db1d32d/metrics/betaTesterUsages?period=P90D&filter%5Bapps%5D=6447306070
     ```

     **Response:**

     ```json
     {  "data": [
         {
           "type": "betaTesterUsages",
           "dataPoints": [
             {
               "start": "2023-07-07",
               "end": "2023-10-05",
               "values": {
                 "crashCount": 11,
                 "sessionCount": 9,
                 "feedbackCount": 21
               }
             }
           ],
           "dimensions": {
             "apps": {
               "data": {
                 "type": "apps",
                 "id": "6447306070"
               },
               "links": {
                 "related": "https://api.appstoreconnect.apple.com/v1/apps/6447306070"
               }
             }
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/betaTesters/1aa1fe09-bb5c-47dd-a067-a6066db1d32d/metrics/betaTesterUsages?period=PT2160H&filter%5Bapps%5D=6447306070"
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
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaTesters-_id_-metrics-betaTesterUsages>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter period: The duration of the reporting period
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForBetaTesterUsageInBetaTesterV1(id: String,
                                                           filters: [GetMetricsForBetaTesterUsageInBetaTesterV1.Filter]? = nil,
                                                           period: GetMetricsForBetaTesterUsageInBetaTesterV1.Period? = nil,
                                                           limit: Int? = nil) -> Request<BetaTesterUsagesV1MetricResponse, ErrorResponse> {
        var customs = [String: String]()
        if let period { customs["period"] = period.rawValue }
        return .init(
            path: "/v1/betaTesters/\(id)/metrics/betaTesterUsages",
            method: .get,
            parameters: .init(
                filters: filters,
                limit: limit,
                customs: customs))
    }
}

public enum GetMetricsForBetaTesterUsageInBetaTesterV1 {
    /**
     Attributes, relationships, and IDs by which to filter.

     Required: `apps`
     */
    public enum Filter: FilterParameter {
        /// Filter by 'apps' relationship dimension
        case apps([String])
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
