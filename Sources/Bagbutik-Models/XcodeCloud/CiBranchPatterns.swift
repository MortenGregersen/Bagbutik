import Bagbutik_Core
import Foundation

public struct CiBranchPatterns: Codable, Sendable {
    public var isAllMatch: Bool?
    public var patterns: [Patterns]?

    public init(isAllMatch: Bool? = nil,
                patterns: [Patterns]? = nil)
    {
        self.isAllMatch = isAllMatch
        self.patterns = patterns
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        isAllMatch = try container.decodeIfPresent(Bool.self, forKey: "isAllMatch")
        patterns = try container.decodeIfPresent([Patterns].self, forKey: "patterns")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(isAllMatch, forKey: "isAllMatch")
        try container.encodeIfPresent(patterns, forKey: "patterns")
    }

    public struct Patterns: Codable, Sendable {
        public var isPrefix: Bool?
        public var pattern: String?

        public init(isPrefix: Bool? = nil,
                    pattern: String? = nil)
        {
            self.isPrefix = isPrefix
            self.pattern = pattern
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            isPrefix = try container.decodeIfPresent(Bool.self, forKey: "isPrefix")
            pattern = try container.decodeIfPresent(String.self, forKey: "pattern")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(isPrefix, forKey: "isPrefix")
            try container.encodeIfPresent(pattern, forKey: "pattern")
        }
    }
}
