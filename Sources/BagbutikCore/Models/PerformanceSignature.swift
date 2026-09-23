import Foundation

/**
 # PerformanceSignature

 A performance signature that identifies a recurring performance issue in an app, with its occurrence count and weight.

 ```
 object PerformanceSignature
 ```

 ## Topics

 ### Objects

 [`object PerformanceSignature.MetricsSummary`](https://developer.apple.com/documentation/AppStoreConnectAPI/PerformanceSignature/MetricsSummary-data.dictionary)

 A summary of the metric values for a performance signature across reference versions.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/performancesignature>
 */
public struct PerformanceSignature: Codable, Sendable {
    public var count: Int?
    public var lineNumber: Int?
    public var metricsSummary: MetricsSummary?
    public var signature: String?
    public var signatureId: String?
    public var sourceFile: String?
    public var trendInfo: DiagnosticInsightDirection?
    public var weight: Double?

    public init(count: Int? = nil,
                lineNumber: Int? = nil,
                metricsSummary: MetricsSummary? = nil,
                signature: String? = nil,
                signatureId: String? = nil,
                sourceFile: String? = nil,
                trendInfo: DiagnosticInsightDirection? = nil,
                weight: Double? = nil)
    {
        self.count = count
        self.lineNumber = lineNumber
        self.metricsSummary = metricsSummary
        self.signature = signature
        self.signatureId = signatureId
        self.sourceFile = sourceFile
        self.trendInfo = trendInfo
        self.weight = weight
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        count = try container.decodeIfPresent(Int.self, forKey: "count")
        lineNumber = try container.decodeIfPresent(Int.self, forKey: "lineNumber")
        metricsSummary = try container.decodeIfPresent(MetricsSummary.self, forKey: "metricsSummary")
        signature = try container.decodeIfPresent(String.self, forKey: "signature")
        signatureId = try container.decodeIfPresent(String.self, forKey: "signatureId")
        sourceFile = try container.decodeIfPresent(String.self, forKey: "sourceFile")
        trendInfo = try container.decodeIfPresent(DiagnosticInsightDirection.self, forKey: "trendInfo")
        weight = try container.decodeIfPresent(Double.self, forKey: "weight")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(count, forKey: "count")
        try container.encodeIfPresent(lineNumber, forKey: "lineNumber")
        try container.encodeIfPresent(metricsSummary, forKey: "metricsSummary")
        try container.encodeIfPresent(signature, forKey: "signature")
        try container.encodeIfPresent(signatureId, forKey: "signatureId")
        try container.encodeIfPresent(sourceFile, forKey: "sourceFile")
        try container.encodeIfPresent(trendInfo, forKey: "trendInfo")
        try container.encodeIfPresent(weight, forKey: "weight")
    }

    public struct MetricsSummary: Codable, Sendable {
        public var referenceVersions: [ReferenceVersions]?

        public init(referenceVersions: [ReferenceVersions]? = nil) {
            self.referenceVersions = referenceVersions
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            referenceVersions = try container.decodeIfPresent([ReferenceVersions].self, forKey: "referenceVersions")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(referenceVersions, forKey: "referenceVersions")
        }

        public struct ReferenceVersions: Codable, Sendable {
            public var value: Double?
            public var version: String?

            public init(value: Double? = nil,
                        version: String? = nil)
            {
                self.value = value
                self.version = version
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                value = try container.decodeIfPresent(Double.self, forKey: "value")
                version = try container.decodeIfPresent(String.self, forKey: "version")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(value, forKey: "value")
                try container.encodeIfPresent(version, forKey: "version")
            }
        }
    }
}
