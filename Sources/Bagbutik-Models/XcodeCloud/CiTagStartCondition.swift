import Bagbutik_Core
import Foundation

/**
 # CiTagStartCondition
 Settings for a start condition that starts a build if a Git tag changes.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citagstartcondition>
 */
public struct CiTagStartCondition: Codable {
    /// A Boolean value that indicates whether Xcode Cloud automatically cancels or skips builds.
    public var autoCancel: Bool?
    /// Settings Xcode Cloud uses to determine whether a change to a tag should start a new build or not.
    public var filesAndFoldersRule: CiFilesAndFoldersRule?
    /// The source branch name and custom patterns you configure for a workflow that starts a new build for changes to a Git tag.
    public var source: CiTagPatterns?

    public init(autoCancel: Bool? = nil,
                filesAndFoldersRule: CiFilesAndFoldersRule? = nil,
                source: CiTagPatterns? = nil)
    {
        self.autoCancel = autoCancel
        self.filesAndFoldersRule = filesAndFoldersRule
        self.source = source
    }
}
