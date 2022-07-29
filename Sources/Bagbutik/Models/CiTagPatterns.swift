import Foundation

/**
 # CiTagPatterns
 Case-sensitive patterns Xcode Cloud uses to determine if a change meets tag names you configure for a workflow’s start condition.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citagpatterns>
 */
public struct CiTagPatterns: Codable {
    /// ​A Boolean value that indicates whether a start condition’s settings apply to all tags. If `true`, the `patterns` attribute isn’t expected. If `false`, the `patterns` attribute is required.
    public var isAllMatch: Bool?
    /// The list of case-sensitive patterns Xcode Cloud uses to determine if a change meets tag names you configure for a workflow’s start condition.
    public var patterns: [Patterns]?

    public init(isAllMatch: Bool? = nil,
                patterns: [Patterns]? = nil)
    {
        self.isAllMatch = isAllMatch
        self.patterns = patterns
    }

    /**
     # CiTagPatterns.Patterns
     A case-sensitive pattern Xcode Cloud uses to determine if a change meets tag names you configure for a workflow’s start condition.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/citagpatterns/patterns>
     */
    public struct Patterns: Codable {
        /// A Boolean value that indicates whether the pattern matches the start of a tag name, or the exact tag name.
        public var isPrefix: Bool?
        /// A case-sensitive string. If the string is a prefix pattern, Xcode Cloud starts a build when the changed tag name starts with this string. Otherwise, Xcode Cloud starts a build when the changed tag name exactly matches this string.
        public var pattern: String?

        public init(isPrefix: Bool? = nil,
                    pattern: String? = nil)
        {
            self.isPrefix = isPrefix
            self.pattern = pattern
        }
    }
}
