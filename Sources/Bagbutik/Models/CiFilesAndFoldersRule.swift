import Foundation

/**
 Settings Xcode Cloud uses to determine whether a change should start a new build or not.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cifilesandfoldersrule>
 */
public struct CiFilesAndFoldersRule: Codable {
    /// Directory and file information Xcode Cloud uses to determine if a change to a file or directory matches a custom start condition.
    @NullCodable public var matchers: [CiStartConditionFileMatcher]?
    /// A string that indicates whether a workflow’s start condition’s Files and Folders setting should start a new build or not for a change.
    @NullCodable public var mode: Mode?

    public init(matchers: [CiStartConditionFileMatcher]? = nil, mode: Mode? = nil) {
        self.matchers = matchers
        self.mode = mode
    }

    public enum Mode: String, Codable, CaseIterable {
        case startIfAnyFileMatches = "START_IF_ANY_FILE_MATCHES"
        case doNotStartIfAllFilesMatch = "DO_NOT_START_IF_ALL_FILES_MATCH"
    }
}
