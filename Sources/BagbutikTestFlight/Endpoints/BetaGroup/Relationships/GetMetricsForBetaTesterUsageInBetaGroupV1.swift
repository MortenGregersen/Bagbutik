import BagbutikCore
import BagbutikModelsShared
import BagbutikTestFlightModels

public extension Request {
    /**
     # Read Metrics for Beta Testers in a Beta Group

     Get beta tester usage metrics for a beta group.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/betaGroups/db51edb0-a8a4-4be9-8481-09dff260ea6e/metrics/betaTesterUsages?groupBy=betaTesters&filter%5BbetaTesters%5D=1aa1fe09-bb5c-47dd-a067-a6066db1d32
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
                 “crashCount”: 13,
                 “sessionCount”: 48,
                 “feedbackCount”: 21
               }
             }
           ],
           “dimensions”: {
             “betaTesters”: {
               “data”: {
                 “type”: “betaTesters”,
                 “id”: “1aa1fe09-bb5c-47dd-a067-a6066db1d32d”
               },
               “links”: {
                 “related”: “https://api.appstoreconnect.apple.com/v1/betaTesters/1aa1fe09-bb5c-47dd-a067-a6066db1d32d”,
                 “groupBy”: “https://api.appstoreconnect.apple.com/v1/betaGroups/db51edb0-a8a4-4be9-8481-09dff260ea6e/metrics/betaTesterUsages?groupBy=betaTesters”
               }
             }
           }
         }
       ],
       “links”: {
         “self”: “https://api.appstoreconnect.apple.com/v1/betaTesters/842d4014-3ecc-4f80-8531-19aa800e3a53/metrics/betaTesterUsages?period=PT8760H&filter%5Bapps%5D=6448250830”
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
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaGroups-_id_-metrics-betaTesterUsages>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter groupBy: The dimension by which to group the results
     - Parameter period: The duration of the reporting period
     - Parameter limit: Maximum number of groups to return per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getMetricsForBetaTesterUsageInBetaGroupV1(id: String,
                                                          filters: [GetMetricsForBetaTesterUsageInBetaGroupV1.Filter]? = nil,
                                                          groupBy: GetMetricsForBetaTesterUsageInBetaGroupV1.GroupBy? = nil,
                                                          period: GetMetricsForBetaTesterUsageInBetaGroupV1.Period? = nil,
                                                          limit: Int? = nil) -> Request<AppsBetaTesterUsagesV1MetricResponse, ErrorResponse> {
        var customs = [String: String]()
        if let groupBy { customs["groupBy"] = groupBy.rawValue }
        if let period { customs["period"] = period.rawValue }
        return .init(
            path: "/v1/betaGroups/\(id)/metrics/betaTesterUsages",
            method: .get,
            parameters: .init(
                filters: filters,
                limit: limit,
                customs: customs))
    }
}

public enum GetMetricsForBetaTesterUsageInBetaGroupV1 {
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
