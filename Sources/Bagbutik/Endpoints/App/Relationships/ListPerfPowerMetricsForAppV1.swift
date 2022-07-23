public extension Request {
    /**
      # Get Power and Performance Metrics for an App
      Get the performance and power metrics data for the most recent version of an app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_power_and_performance_metrics_for_an_app>

      The example below requests iOS app launch metrics on all iPhones for the most-recent app versions. To get metrics for a specific app version instead, use the  endpoint.

      - Parameter id: The id of the requested resource
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPerfPowerMetricsForAppV1(id: String,
                                             filters: [ListPerfPowerMetricsForAppV1.Filter]? = nil) -> Request<XcodeMetrics, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/perfPowerMetrics", method: .get, parameters: .init(filters: filters))
    }
}

public enum ListPerfPowerMetricsForAppV1 {
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

        public enum MetricType: String, ParameterValue, CaseIterable {
            case disk = "DISK"
            case hang = "HANG"
            case battery = "BATTERY"
            case launch = "LAUNCH"
            case memory = "MEMORY"
            case animation = "ANIMATION"
            case termination = "TERMINATION"
        }

        public enum Platform: String, ParameterValue, CaseIterable {
            case iOS = "IOS"
        }
    }
}
