import Foundation

public struct MetricsInsight: Codable {
    public var highImpact: Bool?
    public var latestVersion: String?
    public var maxLatestVersionValue: Double?
    public var metric: String?
    public var metricCategory: MetricCategory?
    public var populations: [Populations]?
    public var referenceVersions: String?
    public var subSystemLabel: String?
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

    public struct Populations: Codable {
        public var deltaPercentage: Double?
        public var device: String?
        public var latestVersionValue: Double?
        public var percentile: String?
        public var referenceAverageValue: Double?
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
