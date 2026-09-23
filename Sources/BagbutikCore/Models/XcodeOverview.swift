import Foundation

/**
 # xcodeOverview

 The performance overview that Xcode presents for an app, including app metadata, insights, and top performance signatures.

 ```
 object xcodeOverview
 ```

 ## Topics

 ### Objects

 [`object xcodeOverview.AppMetadata`](https://developer.apple.com/documentation/AppStoreConnectAPI/xcodeOverview/AppMetadata-data.dictionary)

 Metadata about the app that a performance overview describes.

 [`object xcodeOverview.Insights`](https://developer.apple.com/documentation/AppStoreConnectAPI/xcodeOverview/Insights-data.dictionary)

 Performance insights for an app, including regressions and metrics that are trending up.

 [`object xcodeOverview.Signatures`](https://developer.apple.com/documentation/AppStoreConnectAPI/xcodeOverview/Signatures-data.dictionary)

 The top performance signatures for an app, such as its top hang, launch, and disk-write points.

 ### Dictionaries

 [`object xcodeOverview.Categories`](https://developer.apple.com/documentation/AppStoreConnectAPI/xcodeOverview/Categories-data.dictionary)

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/xcodeoverview>
 */
public struct XcodeOverview: Codable, Sendable {
    public var appMetadata: AppMetadata?
    public var categories: [Categories]?
    public var insights: Insights?
    public var signatures: Signatures?
    public var telemetryIdentifier: String?
    public var version: String?

    public init(appMetadata: AppMetadata? = nil,
                categories: [Categories]? = nil,
                insights: Insights? = nil,
                signatures: Signatures? = nil,
                telemetryIdentifier: String? = nil,
                version: String? = nil)
    {
        self.appMetadata = appMetadata
        self.categories = categories
        self.insights = insights
        self.signatures = signatures
        self.telemetryIdentifier = telemetryIdentifier
        self.version = version
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        appMetadata = try container.decodeIfPresent(AppMetadata.self, forKey: "appMetadata")
        categories = try container.decodeIfPresent([Categories].self, forKey: "categories")
        insights = try container.decodeIfPresent(Insights.self, forKey: "insights")
        signatures = try container.decodeIfPresent(Signatures.self, forKey: "signatures")
        telemetryIdentifier = try container.decodeIfPresent(String.self, forKey: "telemetryIdentifier")
        version = try container.decodeIfPresent(String.self, forKey: "version")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(appMetadata, forKey: "appMetadata")
        try container.encodeIfPresent(categories, forKey: "categories")
        try container.encodeIfPresent(insights, forKey: "insights")
        try container.encodeIfPresent(signatures, forKey: "signatures")
        try container.encodeIfPresent(telemetryIdentifier, forKey: "telemetryIdentifier")
        try container.encodeIfPresent(version, forKey: "version")
    }

    public struct AppMetadata: Codable, Sendable {
        public var appId: String?
        public var bundleId: String?
        public var latestVersion: String?
        public var platform: String?

        public init(appId: String? = nil,
                    bundleId: String? = nil,
                    latestVersion: String? = nil,
                    platform: String? = nil)
        {
            self.appId = appId
            self.bundleId = bundleId
            self.latestVersion = latestVersion
            self.platform = platform
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appId = try container.decodeIfPresent(String.self, forKey: "appId")
            bundleId = try container.decodeIfPresent(String.self, forKey: "bundleId")
            latestVersion = try container.decodeIfPresent(String.self, forKey: "latestVersion")
            platform = try container.decodeIfPresent(String.self, forKey: "platform")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appId, forKey: "appId")
            try container.encodeIfPresent(bundleId, forKey: "bundleId")
            try container.encodeIfPresent(latestVersion, forKey: "latestVersion")
            try container.encodeIfPresent(platform, forKey: "platform")
        }
    }

    public struct Categories: Codable, Sendable {
        public var displayName: String?
        public var identifier: String?
        public var sections: [Sections]?

        public init(displayName: String? = nil,
                    identifier: String? = nil,
                    sections: [Sections]? = nil)
        {
            self.displayName = displayName
            self.identifier = identifier
            self.sections = sections
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            displayName = try container.decodeIfPresent(String.self, forKey: "displayName")
            identifier = try container.decodeIfPresent(String.self, forKey: "identifier")
            sections = try container.decodeIfPresent([Sections].self, forKey: "sections")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(displayName, forKey: "displayName")
            try container.encodeIfPresent(identifier, forKey: "identifier")
            try container.encodeIfPresent(sections, forKey: "sections")
        }

        public struct Sections: Codable, Sendable {
            public var datasets: [Datasets]?
            public var displayName: String?
            public var identifier: String?
            public var relevanceScore: Double?
            public var sortOrder: Int?
            public var unit: Unit?

            public init(datasets: [Datasets]? = nil,
                        displayName: String? = nil,
                        identifier: String? = nil,
                        relevanceScore: Double? = nil,
                        sortOrder: Int? = nil,
                        unit: Unit? = nil)
            {
                self.datasets = datasets
                self.displayName = displayName
                self.identifier = identifier
                self.relevanceScore = relevanceScore
                self.sortOrder = sortOrder
                self.unit = unit
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                datasets = try container.decodeIfPresent([Datasets].self, forKey: "datasets")
                displayName = try container.decodeIfPresent(String.self, forKey: "displayName")
                identifier = try container.decodeIfPresent(String.self, forKey: "identifier")
                relevanceScore = try container.decodeIfPresent(Double.self, forKey: "relevanceScore")
                sortOrder = try container.decodeIfPresent(Int.self, forKey: "sortOrder")
                unit = try container.decodeIfPresent(Unit.self, forKey: "unit")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(datasets, forKey: "datasets")
                try container.encodeIfPresent(displayName, forKey: "displayName")
                try container.encodeIfPresent(identifier, forKey: "identifier")
                try container.encodeIfPresent(relevanceScore, forKey: "relevanceScore")
                try container.encodeIfPresent(sortOrder, forKey: "sortOrder")
                try container.encodeIfPresent(unit, forKey: "unit")
            }

            public struct Datasets: Codable, Sendable {
                public var filterCriteria: FilterCriteria?
                public var points: [Points]?
                public var recommendedMetricGoal: RecommendedMetricGoal?

                public init(filterCriteria: FilterCriteria? = nil,
                            points: [Points]? = nil,
                            recommendedMetricGoal: RecommendedMetricGoal? = nil)
                {
                    self.filterCriteria = filterCriteria
                    self.points = points
                    self.recommendedMetricGoal = recommendedMetricGoal
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    filterCriteria = try container.decodeIfPresent(FilterCriteria.self, forKey: "filterCriteria")
                    points = try container.decodeIfPresent([Points].self, forKey: "points")
                    recommendedMetricGoal = try container.decodeIfPresent(RecommendedMetricGoal.self, forKey: "recommendedMetricGoal")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(filterCriteria, forKey: "filterCriteria")
                    try container.encodeIfPresent(points, forKey: "points")
                    try container.encodeIfPresent(recommendedMetricGoal, forKey: "recommendedMetricGoal")
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
                    public var percentageBreakdown: PercentageBreakdown?
                    public var value: Double?
                    public var version: String?

                    public init(errorMargin: Double? = nil,
                                percentageBreakdown: PercentageBreakdown? = nil,
                                value: Double? = nil,
                                version: String? = nil)
                    {
                        self.errorMargin = errorMargin
                        self.percentageBreakdown = percentageBreakdown
                        self.value = value
                        self.version = version
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        errorMargin = try container.decodeIfPresent(Double.self, forKey: "errorMargin")
                        percentageBreakdown = try container.decodeIfPresent(PercentageBreakdown.self, forKey: "percentageBreakdown")
                        value = try container.decodeIfPresent(Double.self, forKey: "value")
                        version = try container.decodeIfPresent(String.self, forKey: "version")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(errorMargin, forKey: "errorMargin")
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

                public struct RecommendedMetricGoal: Codable, Sendable {
                    public var detail: String?
                    public var value: Double?

                    public init(detail: String? = nil,
                                value: Double? = nil)
                    {
                        self.detail = detail
                        self.value = value
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        detail = try container.decodeIfPresent(String.self, forKey: "detail")
                        value = try container.decodeIfPresent(Double.self, forKey: "value")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(detail, forKey: "detail")
                        try container.encodeIfPresent(value, forKey: "value")
                    }
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

    public struct Signatures: Codable, Sendable {
        public var topDiskWritePoint: [PerformanceSignature]?
        public var topHangPoint: [PerformanceSignature]?
        public var topLaunchPoint: [PerformanceSignature]?

        public init(topDiskWritePoint: [PerformanceSignature]? = nil,
                    topHangPoint: [PerformanceSignature]? = nil,
                    topLaunchPoint: [PerformanceSignature]? = nil)
        {
            self.topDiskWritePoint = topDiskWritePoint
            self.topHangPoint = topHangPoint
            self.topLaunchPoint = topLaunchPoint
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            topDiskWritePoint = try container.decodeIfPresent([PerformanceSignature].self, forKey: "topDiskWritePoint")
            topHangPoint = try container.decodeIfPresent([PerformanceSignature].self, forKey: "topHangPoint")
            topLaunchPoint = try container.decodeIfPresent([PerformanceSignature].self, forKey: "topLaunchPoint")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(topDiskWritePoint, forKey: "topDiskWritePoint")
            try container.encodeIfPresent(topHangPoint, forKey: "topHangPoint")
            try container.encodeIfPresent(topLaunchPoint, forKey: "topLaunchPoint")
        }
    }
}
