import Bagbutik_Core
import Foundation

/**
 # DiagnosticSignature
 The data structure that represents the Diagnostic Signatures resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticsignature>
 */
public struct DiagnosticSignature: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies a diagnostic signature.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "diagnosticSignatures" }
    /// Attributes that describe the diagnostic signature resource.
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var diagnosticType: DiagnosticType?
        public var insight: DiagnosticInsight?
        public var signature: String?
        public var weight: Double?

        public init(diagnosticType: DiagnosticType? = nil,
                    insight: DiagnosticInsight? = nil,
                    signature: String? = nil,
                    weight: Double? = nil)
        {
            self.diagnosticType = diagnosticType
            self.insight = insight
            self.signature = signature
            self.weight = weight
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            diagnosticType = try container.decodeIfPresent(DiagnosticType.self, forKey: "diagnosticType")
            insight = try container.decodeIfPresent(DiagnosticInsight.self, forKey: "insight")
            signature = try container.decodeIfPresent(String.self, forKey: "signature")
            weight = try container.decodeIfPresent(Double.self, forKey: "weight")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(diagnosticType, forKey: "diagnosticType")
            try container.encodeIfPresent(insight, forKey: "insight")
            try container.encodeIfPresent(signature, forKey: "signature")
            try container.encodeIfPresent(weight, forKey: "weight")
        }

        public enum DiagnosticType: String, Sendable, Codable, CaseIterable {
            case diskWrites = "DISK_WRITES"
            case hangs = "HANGS"
            case launches = "LAUNCHES"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = DiagnosticType(rawValue: string) {
                    self = value
                } else if let value = DiagnosticType(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid DiagnosticType value: \(string)"
                    )
                }
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var logs: Logs?

        public init(logs: Logs? = nil) {
            self.logs = logs
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            logs = try container.decodeIfPresent(Logs.self, forKey: "logs")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(logs, forKey: "logs")
        }

        public struct Logs: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }
    }
}
