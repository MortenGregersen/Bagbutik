import Bagbutik_Core
import Foundation

public struct MetricsInsight: Codable, Sendable {
    public var highImpact: Bool?
    public var latestVersion: String?
    public var maxLatestVersionValue: Double?
    public var metric: String?
    public var metricCategory: MetricCategory?
    public var populations: [Populations]?
    public var referenceVersions: String?
    public var subSystemLabel: String?
    public var summaryString: String?

    public init(highImpact: Bool? = nil,
                latestVersion: String? = nil,
                maxLatestVersionValue: Double? = nil,
                metric: String? = nil,
                metricCategory: MetricCategory? = nil,
                populations: [Populations]? = nil,
                referenceVersions: String? = nil,
                subSystemLabel: String? = nil,
                summaryString: String? = nil)
    {
        self.highImpact = highImpact
        self.latestVersion = latestVersion
        self.maxLatestVersionValue = maxLatestVersionValue
        self.metric = metric
        self.metricCategory = metricCategory
        self.populations = populations
        self.referenceVersions = referenceVersions
        self.subSystemLabel = subSystemLabel
        self.summaryString = summaryString
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        highImpact = try container.decodeIfPresent(Bool.self, forKey: "highImpact")
        latestVersion = try container.decodeIfPresent(String.self, forKey: "latestVersion")
        maxLatestVersionValue = try container.decodeIfPresent(Double.self, forKey: "maxLatestVersionValue")
        metric = try container.decodeIfPresent(String.self, forKey: "metric")
        metricCategory = try container.decodeIfPresent(MetricCategory.self, forKey: "metricCategory")
        populations = try container.decodeIfPresent([Populations].self, forKey: "populations")
        referenceVersions = try container.decodeIfPresent(String.self, forKey: "referenceVersions")
        subSystemLabel = try container.decodeIfPresent(String.self, forKey: "subSystemLabel")
        summaryString = try container.decodeIfPresent(String.self, forKey: "summaryString")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(highImpact, forKey: "highImpact")
        try container.encodeIfPresent(latestVersion, forKey: "latestVersion")
        try container.encodeIfPresent(maxLatestVersionValue, forKey: "maxLatestVersionValue")
        try container.encodeIfPresent(metric, forKey: "metric")
        try container.encodeIfPresent(metricCategory, forKey: "metricCategory")
        try container.encodeIfPresent(populations, forKey: "populations")
        try container.encodeIfPresent(referenceVersions, forKey: "referenceVersions")
        try container.encodeIfPresent(subSystemLabel, forKey: "subSystemLabel")
        try container.encodeIfPresent(summaryString, forKey: "summaryString")
    }

    public struct Populations: Codable, Sendable {
        public var deltaPercentage: Double?
        public var device: String?
        public var latestVersionValue: Double?
        public var percentile: String?
        public var referenceAverageValue: Double?
        public var summaryString: String?

        public init(deltaPercentage: Double? = nil,
                    device: String? = nil,
                    latestVersionValue: Double? = nil,
                    percentile: String? = nil,
                    referenceAverageValue: Double? = nil,
                    summaryString: String? = nil)
        {
            self.deltaPercentage = deltaPercentage
            self.device = device
            self.latestVersionValue = latestVersionValue
            self.percentile = percentile
            self.referenceAverageValue = referenceAverageValue
            self.summaryString = summaryString
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            deltaPercentage = try container.decodeIfPresent(Double.self, forKey: "deltaPercentage")
            device = try container.decodeIfPresent(String.self, forKey: "device")
            latestVersionValue = try container.decodeIfPresent(Double.self, forKey: "latestVersionValue")
            percentile = try container.decodeIfPresent(String.self, forKey: "percentile")
            referenceAverageValue = try container.decodeIfPresent(Double.self, forKey: "referenceAverageValue")
            summaryString = try container.decodeIfPresent(String.self, forKey: "summaryString")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(deltaPercentage, forKey: "deltaPercentage")
            try container.encodeIfPresent(device, forKey: "device")
            try container.encodeIfPresent(latestVersionValue, forKey: "latestVersionValue")
            try container.encodeIfPresent(percentile, forKey: "percentile")
            try container.encodeIfPresent(referenceAverageValue, forKey: "referenceAverageValue")
            try container.encodeIfPresent(summaryString, forKey: "summaryString")
        }
    }
}
