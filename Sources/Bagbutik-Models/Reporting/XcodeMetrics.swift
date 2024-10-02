import Bagbutik_Core
import Foundation

public struct XcodeMetrics: Codable, Sendable {
    public var insights: Insights?
    public var productData: [ProductData]?
    public var version: String?

    public init(insights: Insights? = nil,
                productData: [ProductData]? = nil,
                version: String? = nil)
    {
        self.insights = insights
        self.productData = productData
        self.version = version
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        insights = try container.decodeIfPresent(Insights.self, forKey: "insights")
        productData = try container.decodeIfPresent([ProductData].self, forKey: "productData")
        version = try container.decodeIfPresent(String.self, forKey: "version")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(insights, forKey: "insights")
        try container.encodeIfPresent(productData, forKey: "productData")
        try container.encodeIfPresent(version, forKey: "version")
    }

    public struct Insights: Codable, Sendable {
        public var regressions: [MetricsInsight]?
        public var trendingUp: [MetricsInsight]?

        public init(regressions: [MetricsInsight]? = nil,
                    trendingUp: [MetricsInsight]? = nil)
        {
            self.regressions = regressions
            self.trendingUp = trendingUp
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            regressions = try container.decodeIfPresent([MetricsInsight].self, forKey: "regressions")
            trendingUp = try container.decodeIfPresent([MetricsInsight].self, forKey: "trendingUp")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(regressions, forKey: "regressions")
            try container.encodeIfPresent(trendingUp, forKey: "trendingUp")
        }
    }

    public struct ProductData: Codable, Sendable {
        public var metricCategories: [MetricCategories]?
        public var platform: String?

        public init(metricCategories: [MetricCategories]? = nil,
                    platform: String? = nil)
        {
            self.metricCategories = metricCategories
            self.platform = platform
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            metricCategories = try container.decodeIfPresent([MetricCategories].self, forKey: "metricCategories")
            platform = try container.decodeIfPresent(String.self, forKey: "platform")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(metricCategories, forKey: "metricCategories")
            try container.encodeIfPresent(platform, forKey: "platform")
        }

        public struct MetricCategories: Codable, Sendable {
            public var identifier: MetricCategory?
            public var metrics: [Metrics]?

            public init(identifier: MetricCategory? = nil,
                        metrics: [Metrics]? = nil)
            {
                self.identifier = identifier
                self.metrics = metrics
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                identifier = try container.decodeIfPresent(MetricCategory.self, forKey: "identifier")
                metrics = try container.decodeIfPresent([Metrics].self, forKey: "metrics")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(identifier, forKey: "identifier")
                try container.encodeIfPresent(metrics, forKey: "metrics")
            }

            public struct Metrics: Codable, Sendable {
                public var datasets: [Datasets]?
                public var goalKeys: [GoalKeys]?
                public var identifier: String?
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

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    datasets = try container.decodeIfPresent([Datasets].self, forKey: "datasets")
                    goalKeys = try container.decodeIfPresent([GoalKeys].self, forKey: "goalKeys")
                    identifier = try container.decodeIfPresent(String.self, forKey: "identifier")
                    unit = try container.decodeIfPresent(Unit.self, forKey: "unit")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(datasets, forKey: "datasets")
                    try container.encodeIfPresent(goalKeys, forKey: "goalKeys")
                    try container.encodeIfPresent(identifier, forKey: "identifier")
                    try container.encodeIfPresent(unit, forKey: "unit")
                }

                public struct Datasets: Codable, Sendable {
                    public var filterCriteria: FilterCriteria?
                    public var points: [Points]?

                    public init(filterCriteria: FilterCriteria? = nil,
                                points: [Points]? = nil)
                    {
                        self.filterCriteria = filterCriteria
                        self.points = points
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        filterCriteria = try container.decodeIfPresent(FilterCriteria.self, forKey: "filterCriteria")
                        points = try container.decodeIfPresent([Points].self, forKey: "points")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(filterCriteria, forKey: "filterCriteria")
                        try container.encodeIfPresent(points, forKey: "points")
                    }

                    public struct FilterCriteria: Codable, Sendable {
                        public var device: String?
                        public var deviceMarketingName: String?
                        public var percentile: String?

                        public init(device: String? = nil,
                                    deviceMarketingName: String? = nil,
                                    percentile: String? = nil)
                        {
                            self.device = device
                            self.deviceMarketingName = deviceMarketingName
                            self.percentile = percentile
                        }

                        public init(from decoder: Decoder) throws {
                            let container = try decoder.container(keyedBy: AnyCodingKey.self)
                            device = try container.decodeIfPresent(String.self, forKey: "device")
                            deviceMarketingName = try container.decodeIfPresent(String.self, forKey: "deviceMarketingName")
                            percentile = try container.decodeIfPresent(String.self, forKey: "percentile")
                        }

                        public func encode(to encoder: Encoder) throws {
                            var container = encoder.container(keyedBy: AnyCodingKey.self)
                            try container.encodeIfPresent(device, forKey: "device")
                            try container.encodeIfPresent(deviceMarketingName, forKey: "deviceMarketingName")
                            try container.encodeIfPresent(percentile, forKey: "percentile")
                        }
                    }

                    public struct Points: Codable, Sendable {
                        public var errorMargin: Double?
                        public var goal: String?
                        public var percentageBreakdown: PercentageBreakdown?
                        public var value: Double?
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

                        public init(from decoder: Decoder) throws {
                            let container = try decoder.container(keyedBy: AnyCodingKey.self)
                            errorMargin = try container.decodeIfPresent(Double.self, forKey: "errorMargin")
                            goal = try container.decodeIfPresent(String.self, forKey: "goal")
                            percentageBreakdown = try container.decodeIfPresent(PercentageBreakdown.self, forKey: "percentageBreakdown")
                            value = try container.decodeIfPresent(Double.self, forKey: "value")
                            version = try container.decodeIfPresent(String.self, forKey: "version")
                        }

                        public func encode(to encoder: Encoder) throws {
                            var container = encoder.container(keyedBy: AnyCodingKey.self)
                            try container.encodeIfPresent(errorMargin, forKey: "errorMargin")
                            try container.encodeIfPresent(goal, forKey: "goal")
                            try container.encodeIfPresent(percentageBreakdown, forKey: "percentageBreakdown")
                            try container.encodeIfPresent(value, forKey: "value")
                            try container.encodeIfPresent(version, forKey: "version")
                        }

                        public struct PercentageBreakdown: Codable, Sendable {
                            public var subSystemLabel: String?
                            public var value: Double?

                            public init(subSystemLabel: String? = nil,
                                        value: Double? = nil)
                            {
                                self.subSystemLabel = subSystemLabel
                                self.value = value
                            }

                            public init(from decoder: Decoder) throws {
                                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                                subSystemLabel = try container.decodeIfPresent(String.self, forKey: "subSystemLabel")
                                value = try container.decodeIfPresent(Double.self, forKey: "value")
                            }

                            public func encode(to encoder: Encoder) throws {
                                var container = encoder.container(keyedBy: AnyCodingKey.self)
                                try container.encodeIfPresent(subSystemLabel, forKey: "subSystemLabel")
                                try container.encodeIfPresent(value, forKey: "value")
                            }
                        }
                    }
                }

                public struct GoalKeys: Codable, Sendable {
                    public var goalKey: String?
                    public var lowerBound: Int?
                    public var upperBound: Int?

                    public init(goalKey: String? = nil,
                                lowerBound: Int? = nil,
                                upperBound: Int? = nil)
                    {
                        self.goalKey = goalKey
                        self.lowerBound = lowerBound
                        self.upperBound = upperBound
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        goalKey = try container.decodeIfPresent(String.self, forKey: "goalKey")
                        lowerBound = try container.decodeIfPresent(Int.self, forKey: "lowerBound")
                        upperBound = try container.decodeIfPresent(Int.self, forKey: "upperBound")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(goalKey, forKey: "goalKey")
                        try container.encodeIfPresent(lowerBound, forKey: "lowerBound")
                        try container.encodeIfPresent(upperBound, forKey: "upperBound")
                    }
                }

                public struct Unit: Codable, Sendable {
                    public var displayName: String?
                    public var identifier: String?

                    public init(displayName: String? = nil,
                                identifier: String? = nil)
                    {
                        self.displayName = displayName
                        self.identifier = identifier
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        displayName = try container.decodeIfPresent(String.self, forKey: "displayName")
                        identifier = try container.decodeIfPresent(String.self, forKey: "identifier")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(displayName, forKey: "displayName")
                        try container.encodeIfPresent(identifier, forKey: "identifier")
                    }
                }
            }
        }
    }
}
