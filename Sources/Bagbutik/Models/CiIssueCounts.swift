import Foundation

/**
 The data structure that represents an Issue Counts resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciissuecounts>
 */
public struct CiIssueCounts: Codable {
    /// The number of analyzer warnings.
    @NullCodable public var analyzerWarnings: Int?
    /// The number of errors.
    @NullCodable public var errors: Int?
    /// The number of failing tests.
    @NullCodable public var testFailures: Int?
    /// The number of warnings.
    @NullCodable public var warnings: Int?

    public init(analyzerWarnings: Int? = nil, errors: Int? = nil, testFailures: Int? = nil, warnings: Int? = nil) {
        self.analyzerWarnings = analyzerWarnings
        self.errors = errors
        self.testFailures = testFailures
        self.warnings = warnings
    }
}
