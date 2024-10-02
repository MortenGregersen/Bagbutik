import Bagbutik_Core
import Foundation

public struct DiagnosticInsight: Codable, Sendable {
    public var direction: DiagnosticInsightDirection?
    public var insightType: DiagnosticInsightType?
    public var referenceVersions: [ReferenceVersions]?

    public init(direction: DiagnosticInsightDirection? = nil,
                insightType: DiagnosticInsightType? = nil,
                referenceVersions: [ReferenceVersions]? = nil)
    {
        self.direction = direction
        self.insightType = insightType
        self.referenceVersions = referenceVersions
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        direction = try container.decodeIfPresent(DiagnosticInsightDirection.self, forKey: "direction")
        insightType = try container.decodeIfPresent(DiagnosticInsightType.self, forKey: "insightType")
        referenceVersions = try container.decodeIfPresent([ReferenceVersions].self, forKey: "referenceVersions")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(direction, forKey: "direction")
        try container.encodeIfPresent(insightType, forKey: "insightType")
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
