public extension Request {
    enum ListPerfPowerMetricsForBuild {
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
            }

            public enum Platform: String, ParameterValue, CaseIterable {
                case iOS = "IOS"
            }
        }
    }

    /**
      # Get Power and Performance Metrics for a Build
      Get the performance and power metrics data for a specific build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/get_power_and_performance_metrics_for_a_build>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPerfPowerMetricsForBuild(id: String,
                                             filters: [ListPerfPowerMetricsForBuild.Filter]? = nil) -> Request<PerfPowerMetricsResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/perfPowerMetrics", method: .get, parameters: .init(filters: filters))
    }
}
