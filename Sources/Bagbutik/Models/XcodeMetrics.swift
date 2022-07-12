import Foundation

public struct XcodeMetrics: Codable {
    public var insights: Insights?
    public var productData: [ProductData]?
    public var version: String?

    public init(insights: Insights? = nil, productData: [ProductData]? = nil, version: String? = nil) {
        self.insights = insights
        self.productData = productData
        self.version = version
    }

    public struct Insights: Codable {
        public var regressions: [MetricsInsight]?
        public var trendingUp: [MetricsInsight]?

        public init(regressions: [MetricsInsight]? = nil, trendingUp: [MetricsInsight]? = nil) {
            self.regressions = regressions
            self.trendingUp = trendingUp
        }
    }

    public struct ProductData: Codable {
        public var metricCategories: [MetricCategories]?
        public var platform: String?

        public init(metricCategories: [MetricCategories]? = nil, platform: String? = nil) {
            self.metricCategories = metricCategories
            self.platform = platform
        }

        public struct MetricCategories: Codable {
            public var identifier: MetricCategory?
            public var metrics: [Metrics]?

            public init(identifier: MetricCategory? = nil, metrics: [Metrics]? = nil) {
                self.identifier = identifier
                self.metrics = metrics
            }

            public struct Metrics: Codable {
                public var datasets: [Datasets]?
                public var goalKeys: [GoalKeys]?
                public var identifier: String?
                public var unit: Unit?

                public init(datasets: [Datasets]? = nil, goalKeys: [GoalKeys]? = nil, identifier: String? = nil, unit: Unit? = nil) {
                    self.datasets = datasets
                    self.goalKeys = goalKeys
                    self.identifier = identifier
                    self.unit = unit
                }

                public struct Datasets: Codable {
                    public var filterCriteria: FilterCriteria?
                    public var points: [Points]?

                    public init(filterCriteria: FilterCriteria? = nil, points: [Points]? = nil) {
                        self.filterCriteria = filterCriteria
                        self.points = points
                    }

                    public struct FilterCriteria: Codable {
                        public var device: String?
                        public var deviceMarketingName: String?
                        public var percentile: String?

                        public init(device: String? = nil, deviceMarketingName: String? = nil, percentile: String? = nil) {
                            self.device = device
                            self.deviceMarketingName = deviceMarketingName
                            self.percentile = percentile
                        }
                    }

                    public struct Points: Codable {
                        public var errorMargin: Double?
                        public var goal: String?
                        public var percentageBreakdown: PercentageBreakdown?
                        public var value: Double?
                        public var version: String?

                        public init(errorMargin: Double? = nil, goal: String? = nil, percentageBreakdown: PercentageBreakdown? = nil, value: Double? = nil, version: String? = nil) {
                            self.errorMargin = errorMargin
                            self.goal = goal
                            self.percentageBreakdown = percentageBreakdown
                            self.value = value
                            self.version = version
                        }

                        public struct PercentageBreakdown: Codable {
                            public var subSystemLabel: String?
                            public var value: Double?

                            public init(subSystemLabel: String? = nil, value: Double? = nil) {
                                self.subSystemLabel = subSystemLabel
                                self.value = value
                            }
                        }
                    }
                }

                public struct GoalKeys: Codable {
                    public var goalKey: String?
                    public var lowerBound: Int?
                    public var upperBound: Int?

                    public init(goalKey: String? = nil, lowerBound: Int? = nil, upperBound: Int? = nil) {
                        self.goalKey = goalKey
                        self.lowerBound = lowerBound
                        self.upperBound = upperBound
                    }
                }

                public struct Unit: Codable {
                    public var displayName: String?
                    public var identifier: String?

                    public init(displayName: String? = nil, identifier: String? = nil) {
                        self.displayName = displayName
                        self.identifier = identifier
                    }
                }
            }
        }
    }
}
