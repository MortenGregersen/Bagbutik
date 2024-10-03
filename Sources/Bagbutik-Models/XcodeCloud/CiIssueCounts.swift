import Bagbutik_Core
import Foundation

public struct CiIssueCounts: Codable, Sendable {
    public var analyzerWarnings: Int?
    public var errors: Int?
    public var testFailures: Int?
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
