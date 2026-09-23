import BagbutikCore
import BagbutikModelsShared
import BagbutikReportingModels

public extension Request {
    /**
     # Get power and performance metrics for a build

     Get the performance and power metrics data for a specific build.

     ## Discussion

     The example below requests iOS animation metrics on all iPads for a specific build. To get the metrics for all of the most-recent app versions instead, use the [`Get power and performance metrics for an app`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-perfPowerMetrics) endpoint.

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/builds/43d3a970-273c-4bc9-88ee-aa5c05610ac1/perfPowerMetrics?filter[deviceType]=all_ipads&filter[metricType]=ANIMATION&filter[platform]=iOS
     ```

     **Response:**

     ```json
     {
       "productData": [
         {
           "platform": "iOS",
           "metricCategories": [
             {
               "identifier": "ANIMATION",
               "metrics": [
                 {
                   "identifier": "scrollHitchRate",
                   "unit": {
                     "identifier": "scrollHitchRate",
                     "displayName": "%"
                   },
                   "datasets": [
                     {
                       "filterCriteria": {
                         "percentile": "percentile.fifty",
                         "device": "all_ipads",
                         "deviceMarketingName": "All iPads"
                       },
                       "points": [
                         {
                           "version": "10.0",
                           "value": 6.5,
                           "goal": "fair"
                         }
                       ]
                     },
                     {
                       "filterCriteria": {
                         "percentile": "percentile.ninety",
                         "device": "all_ipads",
                         "deviceMarketingName": "All iPads"
                       },
                       "points": [
                         {
                           "version": "10.0",
                           "value": 29.7,
                           "goal": "poor"
                         }
                       ]
                     }
                   ],
                   "goalKeys": [
                     {
                       "goalKey": "poor",
                       "lowerBound": 10
                     },
                     {
                       "upperBound": 10,
                       "goalKey": "fair",
                       "lowerBound": 5
                     },
                     {
                       "upperBound": 5,
                       "goalKey": "good",
                       "lowerBound": 0
                     }
                   ]
                 }
               ]
             }
           ]
         }
       ],
       "version": "1.0.0"
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-perfPowerMetrics>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPerfPowerMetricsForBuildV1(id: String,
                                               filters: [ListPerfPowerMetricsForBuildV1.Filter]? = nil) -> Request<XcodeMetrics, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/perfPowerMetrics",
            method: .get,
            parameters: .init(filters: filters))
    }
}

public enum ListPerfPowerMetricsForBuildV1 {
    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'deviceType'
        case deviceType([String])
        /// Filter by attribute 'metricType'
        case metricType([MetricType])
        /// Filter by attribute 'platform'
        case platform([Platform])

        public enum MetricType: String, Sendable, ParameterValue, Codable, CaseIterable {
            case animation = "ANIMATION"
            case battery = "BATTERY"
            case disk = "DISK"
            case hang = "HANG"
            case launch = "LAUNCH"
            case memory = "MEMORY"
            case storage = "STORAGE"
            case termination = "TERMINATION"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = MetricType(rawValue: string) {
                    self = value
                } else if let value = MetricType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid MetricType value: \(string)"
                    )
                }
            }
        }

        public enum Platform: String, Sendable, ParameterValue, Codable, CaseIterable {
            case iOS = "IOS"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Platform(rawValue: string) {
                    self = value
                } else if let value = Platform(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Platform value: \(string)"
                    )
                }
            }
        }
    }
}
