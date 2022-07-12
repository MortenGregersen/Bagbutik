public extension Request {
    /**
      # Get Power and Performance Metrics for an App.
      Get the performance and power metrics data for the most recent versions of an app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_power_and_performance_metrics_for_an_app>

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

public enum V1ListPerfPowerMetricsForApp {
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

        /// Strings that represent Apple operating systems.
        public enum Platform: String, ParameterValue, CaseIterable {
            /// A string that represents iOS.
            case iOS = "IOS"
        }
    }
}
