import Foundation

/**
 # xcodeMetrics
 A response that contains power and performance measurements for your app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics>
 */
public struct XcodeMetrics: Codable {
    /// Analysis of data collected about the power and performance of your app that includes regressions and trends.
    public var insights: Insights?
    /// An array of metrics data containing power and performance measurements for your app, organized by platform.
    public var productData: [ProductData]?
    /// The current App Store Connect API version.
    public var version: String?

    public init(insights: Insights? = nil,
                productData: [ProductData]? = nil,
                version: String? = nil)
    {
        self.insights = insights
        self.productData = productData
        self.version = version
    }

    /**
     # xcodeMetrics.Insights
     Analysis of power and performance data collected for your app that includes regressions and trends.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics/insights>
     */
    public struct Insights: Codable {
        /// An array of metrics that have significantly increased between app versions.
        public var regressions: [MetricsInsight]?
        /// An array of metrics that have moderately increased between app versions.
        public var trendingUp: [MetricsInsight]?

        public init(regressions: [MetricsInsight]? = nil,
                    trendingUp: [MetricsInsight]? = nil)
        {
            self.regressions = regressions
            self.trendingUp = trendingUp
        }
    }

    /**
     # xcodeMetrics.ProductData
     The metrics information of an app on a specific platform.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics/productdata>
     */
    public struct ProductData: Codable {
        /// An array of metrics by category.
        public var metricCategories: [MetricCategories]?
        /// The Apple platform on which the system gathered the metrics about your app.
        public var platform: String?

        public init(metricCategories: [MetricCategories]? = nil,
                    platform: String? = nil)
        {
            self.metricCategories = metricCategories
            self.platform = platform
        }

        /**
         # xcodeMetrics.ProductData.MetricCategories
         A metric category and its associated array of data and measurements.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics/productdata/metriccategories>
         */
        public struct MetricCategories: Codable {
            /// The category of the metric that this product data is about.
            public var identifier: MetricCategory?
            /// An array of data and measurements for the metric category specified by the `identifier`.
            public var metrics: [Metrics]?

            public init(identifier: MetricCategory? = nil,
                        metrics: [Metrics]? = nil)
            {
                self.identifier = identifier
                self.metrics = metrics
            }

            /**
             # xcodeMetrics.ProductData.MetricCategories.Metrics
             Data that relates to power and performance measurements for an app, including its datasets, goal keys, metrics identifier, and unit of measurement.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics/productdata/metriccategories/metrics>
             */
            public struct Metrics: Codable {
                /// An array of datasets containing metric values by app version filtered by percentile and device type.
                public var datasets: [Datasets]?
                /// An array of terms used to classify a metric value, and the range of values for each classification.
                public var goalKeys: [GoalKeys]?
                /// The identifier of the specific metric within the contained metric category.
                public var identifier: String?
                /// The metric’s unit of measurement.
                public var unit: Unit?

                public init(datasets: [Datasets]? = nil,
                            goalKeys: [GoalKeys]? = nil,
                            identifier: String? = nil,
                            unit: Unit? = nil)
                {
                    self.datasets = datasets
                    self.goalKeys = goalKeys
                    self.identifier = identifier
                    self.unit = unit
                }

                /**
                 # xcodeMetrics.ProductData.MetricCategories.Metrics.Datasets
                 A set of data containing metric values for each app version, filtered by percentile and device type.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics/productdata/metriccategories/metrics/datasets>
                 */
                public struct Datasets: Codable {
                    /// The device and percentile criteria by which the dataset is filtered.
                    public var filterCriteria: FilterCriteria?
                    /// An array containing metric values for each app version.
                    public var points: [Points]?

                    public init(filterCriteria: FilterCriteria? = nil,
                                points: [Points]? = nil)
                    {
                        self.filterCriteria = filterCriteria
                        self.points = points
                    }

                    /**
                     # xcodeMetrics.ProductData.MetricCategories.Metrics.Datasets.FilterCriteria
                     The device and percentile criteria by which the system filters a metrics dataset.

                     Full documentation:
                     <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics/productdata/metriccategories/metrics/datasets/filtercriteria>
                     */
                    public struct FilterCriteria: Codable {
                        /// The device type that the measurement is collected on.
                        public var device: String?
                        /// The human-readable string containing the device name.
                        public var deviceMarketingName: String?
                        /// A percentile of users affected by the metric value. The 50th percentile represents a typical user experience. The 90th percentile represents the user experience when the metric value is the highest or lowest, depending on the metric.
                        public var percentile: String?

                        public init(device: String? = nil,
                                    deviceMarketingName: String? = nil,
                                    percentile: String? = nil)
                        {
                            self.device = device
                            self.deviceMarketingName = deviceMarketingName
                            self.percentile = percentile
                        }
                    }

                    /**
                     # xcodeMetrics.ProductData.MetricCategories.Metrics.Datasets.Points
                     A metric value of a goal for a specific app version, with a breakdown by metric subtypes.

                     Full documentation:
                     <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics/productdata/metriccategories/metrics/datasets/points>
                     */
                    public struct Points: Codable {
                        /// The margin of error estimated based on the sample size and metric type, for metrics with an insufficient data volume. Note: For the system to provide a metric, the number of samples must meet a minimum threshold size. The `errorMargin` is present if a metric meets the minimum, but is inaccurate within a margin. If the metric surpasses a high enough threshold, the `errorMargin` isn’t present.
                        public var errorMargin: Double?
                        /// The metric value’s classification in terms of a goal key, such as `"good",` `"fair"`, or `"poor"`.
                        public var goal: String?
                        /// The percentage of the metric value each metric subtype contributes.
                        public var percentageBreakdown: PercentageBreakdown?
                        /// The metric value. The `unit` field of the ``XcodeMetrics/ProductData/MetricCategories/Metrics`` object specifies the units.
                        public var value: Double?
                        /// The app version.
                        public var version: String?

                        public init(errorMargin: Double? = nil,
                                    goal: String? = nil,
                                    percentageBreakdown: PercentageBreakdown? = nil,
                                    value: Double? = nil,
                                    version: String? = nil)
                        {
                            self.errorMargin = errorMargin
                            self.goal = goal
                            self.percentageBreakdown = percentageBreakdown
                            self.value = value
                            self.version = version
                        }

                        /**
                         # xcodeMetrics.ProductData.MetricCategories.Metrics.Datasets.Points.PercentageBreakdown
                         A metric subtype and the percentage of the metric value it contributes.

                         Full documentation:
                         <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics/productdata/metriccategories/metrics/datasets/points/percentagebreakdown>
                         */
                        public struct PercentageBreakdown: Codable {
                            /// A string that describes the metric subtype, which provides more information about the measurement.
                            public var subSystemLabel: String?
                            /// The percentage of the metric value the metric subtype contributes. Values are between `0` and `100`.
                            public var value: Double?

                            public init(subSystemLabel: String? = nil,
                                        value: Double? = nil)
                            {
                                self.subSystemLabel = subSystemLabel
                                self.value = value
                            }
                        }
                    }
                }

                /**
                 # xcodeMetrics.ProductData.MetricCategories.Metrics.GoalKeys
                 A classification of a metrics value and the lower- and upper-bound values that qualify a metrics value for the classification.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics/productdata/metriccategories/metrics/goalkeys>
                 */
                public struct GoalKeys: Codable {
                    /// The name of the classification, such as `“good”`, `“fair”`, and `“poor”`.
                    public var goalKey: String?
                    /// The lower bound value to qualify for the goal key.
                    public var lowerBound: Int?
                    /// The upper bound value to qualify for the goal key.
                    public var upperBound: Int?

                    public init(goalKey: String? = nil,
                                lowerBound: Int? = nil,
                                upperBound: Int? = nil)
                    {
                        self.goalKey = goalKey
                        self.lowerBound = lowerBound
                        self.upperBound = upperBound
                    }
                }

                /**
                 # xcodeMetrics.ProductData.MetricCategories.Metrics.Unit
                 A unit of measurement and its display name.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/xcodemetrics/productdata/metriccategories/metrics/unit>
                 */
                public struct Unit: Codable {
                    /// The display name for the unit of measurement.
                    public var displayName: String?
                    /// The unit of measurement.
                    public var identifier: String?

                    public init(displayName: String? = nil,
                                identifier: String? = nil)
                    {
                        self.displayName = displayName
                        self.identifier = identifier
                    }
                }
            }
        }
    }
}
