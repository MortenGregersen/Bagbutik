import Bagbutik_Core
import Foundation

/**
 # CiBranchPatterns
 Case-sensitive patterns Xcode Cloud uses to determine if a change meets branch names you configure for a workflow’s start condition.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibranchpatterns>
 */
public struct CiBranchPatterns: Codable {
    /// ​A Boolean value that indicates whether a start condition’s settings apply to all branches. If `true`, the `patterns` attribute isn’t expected. If `false`, the `patterns` attribute is required.
    public var isAllMatch: Bool?
    /// The list of case-sensitive patterns Xcode Cloud uses to determine if a change meets branch names you configure for a workflow’s start condition.
    public var patterns: [Patterns]?

    public init(isAllMatch: Bool? = nil,
                patterns: [Patterns]? = nil)
    {
        self.isAllMatch = isAllMatch
        self.patterns = patterns
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        isAllMatch = try container.decodeIfPresent(Bool.self, forKey: .isAllMatch)
        patterns = try container.decodeIfPresent([Patterns].self, forKey: .patterns)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(isAllMatch, forKey: .isAllMatch)
        try container.encodeIfPresent(patterns, forKey: .patterns)
    }

    private enum CodingKeys: String, CodingKey {
        case isAllMatch
        case patterns
    }

    /**
     # CiBranchPatterns.Patterns
     A case-sensitive pattern Xcode Cloud uses to determine if a change meets branch names you configure for a workflow’s start condition.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cibranchpatterns/patterns>
     */
    public struct Patterns: Codable {
        /// A Boolean value that indicates whether the pattern matches the start of a branch name, or the exact branch name.
        public var isPrefix: Bool?
        /// A case-sensitive string. If the string is a prefix pattern, Xcode Cloud starts a build when the changed branch name starts with this string. Otherwise, Xcode Cloud starts a build when the changed branch name exactly matches this string.
        public var pattern: String?

        public init(isPrefix: Bool? = nil,
                    pattern: String? = nil)
        {
            self.isPrefix = isPrefix
            self.pattern = pattern
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            isPrefix = try container.decodeIfPresent(Bool.self, forKey: .isPrefix)
            pattern = try container.decodeIfPresent(String.self, forKey: .pattern)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(isPrefix, forKey: .isPrefix)
            try container.encodeIfPresent(pattern, forKey: .pattern)
        }

        private enum CodingKeys: String, CodingKey {
            case isPrefix
            case pattern
        }
    }
}
