import Foundation

/**
 Case-sensitive patterns Xcode Cloud uses to determine if a change meets tag names you configure for a workflow’s start condition.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citagpatterns>
 */
public struct CiTagPatterns: Codable {
    /// A Boolean value that indicates whether a start condition’s settings apply to all tags. If true, the patterns attribute isn’t expected. If false, the patterns attribute is required.
    @NullCodable public var isAllMatch: Bool?
    /// The list of case-sensitive patterns Xcode Cloud uses to determine if a change meets tag names you configure for a workflow’s start condition.
    @NullCodable public var patterns: [Patterns]?

    public init(isAllMatch: Bool? = nil, patterns: [Patterns]? = nil) {
        self.isAllMatch = isAllMatch
        self.patterns = patterns
    }

    public struct Patterns: Codable {
        @NullCodable public var isPrefix: Bool?
        @NullCodable public var pattern: String?

        public init(isPrefix: Bool? = nil, pattern: String? = nil) {
            self.isPrefix = isPrefix
            self.pattern = pattern
        }
    }
}
