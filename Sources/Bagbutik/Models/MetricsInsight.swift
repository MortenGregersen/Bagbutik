import Foundation

/**
 Results of an analysis of metric data for a single metric category for your app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/metricsinsight>
 */
public struct MetricsInsight: Codable {
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

    public init(highImpact: Bool? = nil, latestVersion: String? = nil, maxLatestVersionValue: Double? = nil, metric: String? = nil, metricCategory: MetricCategory? = nil, populations: [Populations]? = nil, referenceVersions: String? = nil, subSystemLabel: String? = nil, summaryString: String? = nil) {
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

    /**
     The value of a metric for a device type on the latest app version, and its percent change as compared with previous app versions.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/metricsinsight/populations>
     */
    public struct Populations: Codable {
        /// The percentage increase between the values of `latestVersionValue` and `referenceAverageValue`.
        public var deltaPercentage: Double?
        /// The device type.
        public var device: String?
        /// The value of the metric for the latest version of the app.
        public var latestVersionValue: Double?
        /// The percentile of users that are affected by this metric value. For example, the 50th percentile represents a typical user experience, and the 90th percentile represents the highest or lowest numbers, depending on the metric.
        public var percentile: String?
        /// The average value of the metric for all reference app versions.
        public var referenceAverageValue: Double?
        /// A human-readable description of the metric and population.
        public var summaryString: String?

        public init(deltaPercentage: Double? = nil, device: String? = nil, latestVersionValue: Double? = nil, percentile: String? = nil, referenceAverageValue: Double? = nil, summaryString: String? = nil) {
            self.deltaPercentage = deltaPercentage
            self.device = device
            self.latestVersionValue = latestVersionValue
            self.percentile = percentile
            self.referenceAverageValue = referenceAverageValue
            self.summaryString = summaryString
        }
    }
}
