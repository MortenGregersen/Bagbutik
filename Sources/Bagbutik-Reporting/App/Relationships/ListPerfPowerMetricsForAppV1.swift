import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get Power and Performance Metrics for an App
     Get the performance and power metrics data for the most recent version of an app.

     The example below requests iOS app launch metrics on all iPhones for the most-recent app versions. To get metrics for a specific app version instead, use the [Get Power and Performance Metrics for a Build](https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-perfpowermetrics) endpoint.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-perfPowerMetrics>

     - Parameter id: The id of the requested resource
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPerfPowerMetricsForAppV1(id: String,
                                             filters: [ListPerfPowerMetricsForAppV1.Filter]? = nil) -> Request<XcodeMetrics, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/perfPowerMetrics", method: .get, parameters: .init(filters: filters))
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

        public enum MetricType: String, Sendable, ParameterValue, Codable, CaseIterable {
            case animation = "ANIMATION"
            case battery = "BATTERY"
            case disk = "DISK"
            case hang = "HANG"
            case launch = "LAUNCH"
            case memory = "MEMORY"
            case termination = "TERMINATION"
        }

        public enum Platform: String, Sendable, ParameterValue, Codable, CaseIterable {
            case iOS = "IOS"
        }
    }
}
