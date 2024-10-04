import Bagbutik_Core
import Foundation

/**
 # MetricsInsight
 Results of an analysis of metric data for a single metric category for your app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/metricsinsight>
 */
public struct MetricsInsight: Codable, Sendable {
    /// A Boolean value that indicates whether the insight is high impact, meaning the metrics show that the latest app version has a regression of 100% or more, compared with the average values of the metric from the previous app versions.
    public var highImpact: Bool?
    /// The version number of the most current version of the app.
    public var latestVersion: String?
    /// The maximum value of this metric for the latest app version, from the values in `populations`.
    public var maxLatestVersionValue: Double?
    /// The specific measurement within the `metricCategory` that this insight analyzes.
    public var metric: String?
    /// The category of the metric that this insight is about.
    public var metricCategory: MetricCategory?
    /// An array of metrics organized by device type on the latest app version, that includes the percent change of the metric as compared with previous app versions.
    public var populations: [Populations]?
    /// A list of previous app versions that the system uses to compare the current app version to, when calculating metric value regressions or trends.
    public var referenceVersions: String?
    /// A metric subtype, which provides additional information about the source of the measurement.
    public var subSystemLabel: String?
    /// A human-readable description of the trend.
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
