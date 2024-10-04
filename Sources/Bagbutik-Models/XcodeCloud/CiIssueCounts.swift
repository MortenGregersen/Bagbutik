import Bagbutik_Core
import Foundation

/**
 # CiIssueCounts
 The data structure that represents an Issue Counts resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciissuecounts>
 */
public struct CiIssueCounts: Codable, Sendable {
    /// The number of analyzer warnings.
    public var analyzerWarnings: Int?
    /// The number of errors.
    public var errors: Int?
    /// The number of failing tests.
    public var testFailures: Int?
    /// The number of warnings.
    public var warnings: Int?

    public init(analyzerWarnings: Int? = nil,
                errors: Int? = nil,
                testFailures: Int? = nil,
                warnings: Int? = nil)
    {
        self.analyzerWarnings = analyzerWarnings
        self.errors = errors
        self.testFailures = testFailures
        self.warnings = warnings
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        analyzerWarnings = try container.decodeIfPresent(Int.self, forKey: "analyzerWarnings")
        errors = try container.decodeIfPresent(Int.self, forKey: "errors")
        testFailures = try container.decodeIfPresent(Int.self, forKey: "testFailures")
        warnings = try container.decodeIfPresent(Int.self, forKey: "warnings")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(analyzerWarnings, forKey: "analyzerWarnings")
        try container.encodeIfPresent(errors, forKey: "errors")
        try container.encodeIfPresent(testFailures, forKey: "testFailures")
        try container.encodeIfPresent(warnings, forKey: "warnings")
    }
}
