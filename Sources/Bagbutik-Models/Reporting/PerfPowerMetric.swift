import Bagbutik_Core
import Foundation

/**
 # PerfPowerMetric
 Unused.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/perfpowermetric>
 */
public struct PerfPowerMetric: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "perfPowerMetrics" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
        public var deviceType: String?
        public var metricType: MetricType?
        public var platform: Platform?

        public init(deviceType: String? = nil,
                    metricType: MetricType? = nil,
                    platform: Platform? = nil)
        {
            self.deviceType = deviceType
            self.metricType = metricType
            self.platform = platform
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            deviceType = try container.decodeIfPresent(String.self, forKey: "deviceType")
            metricType = try container.decodeIfPresent(MetricType.self, forKey: "metricType")
            platform = try container.decodeIfPresent(Platform.self, forKey: "platform")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(deviceType, forKey: "deviceType")
            try container.encodeIfPresent(metricType, forKey: "metricType")
            try container.encodeIfPresent(platform, forKey: "platform")
        }

        public enum MetricType: String, Sendable, Codable, CaseIterable {
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

        public enum Platform: String, Sendable, Codable, CaseIterable {
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
