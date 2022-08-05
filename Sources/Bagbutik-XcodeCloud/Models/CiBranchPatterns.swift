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
    }
}
