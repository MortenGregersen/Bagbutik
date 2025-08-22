import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get Power and Performance Metrics for a Build
     Get the performance and power metrics data for a specific build.

     The example below requests iOS animation metrics on all iPads for a specific build. To get the metrics for all of the most-recent app versions instead, use the [Get Power and Performance Metrics for an App](https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-perfpowermetrics) endpoint.

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
