import Foundation

/**
 The data structure that represents the Power and Performance Metrics resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/perfpowermetric>
 */
public struct PerfPowerMetric: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "perfPowerMetrics" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    /**
     Attributes that describe a Power and Performance Metrics resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/perfpowermetric/attributes>
     */
    public struct Attributes: Codable {
        public let deviceType: String?
        public let metricType: MetricType?
        public let platform: Platform?

        public init(deviceType: String? = nil, metricType: MetricType? = nil, platform: Platform? = nil) {
            self.deviceType = deviceType
            self.metricType = metricType
            self.platform = platform
        }

        public enum MetricType: String, Codable, CaseIterable {
            case disk = "DISK"
            case hang = "HANG"
            case battery = "BATTERY"
            case launch = "LAUNCH"
            case memory = "MEMORY"
            case animation = "ANIMATION"
            case termination = "TERMINATION"
        }

        /// Strings that represent Apple operating systems.
        public enum Platform: String, Codable, CaseIterable {
            /// A string that represents iOS.
            case iOS = "IOS"
        }
    }
}
