import Bagbutik_Core
import Foundation

/**
 # CiFilesAndFoldersRule
 Settings Xcode Cloud uses to determine whether a change should start a new build or not.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cifilesandfoldersrule>
 */
public struct CiFilesAndFoldersRule: Codable, Sendable {
    /// Directory and file information Xcode Cloud uses to determine if a change to a file or directory matches a custom start condition.
    public var matchers: [CiStartConditionFileMatcher]?
    /// A string that indicates whether a workflow’s start condition’s Files and Folders setting should start a new build or not for a change.
    public var mode: Mode?

    public init(matchers: [CiStartConditionFileMatcher]? = nil,
                mode: Mode? = nil)
    {
        self.matchers = matchers
        self.mode = mode
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        matchers = try container.decodeIfPresent([CiStartConditionFileMatcher].self, forKey: "matchers")
        mode = try container.decodeIfPresent(Mode.self, forKey: "mode")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(matchers, forKey: "matchers")
        try container.encodeIfPresent(mode, forKey: "mode")
    }

    public enum Mode: String, Sendable, Codable, CaseIterable {
        case doNotStartIfAllFilesMatch = "DO_NOT_START_IF_ALL_FILES_MATCH"
        case startIfAnyFileMatches = "START_IF_ANY_FILE_MATCHES"
    }
}
