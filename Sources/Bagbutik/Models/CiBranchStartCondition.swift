import Foundation

/**
 Settings for a start condition that starts a build if a branch changes.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibranchstartcondition>
 */
public struct CiBranchStartCondition: Codable {
    /// A Boolean value that indicates whether Xcode Cloud automatically cancels or skips builds.
    public let autoCancel: Bool?
    /// Settings Xcode Cloud uses to determine whether a change to a branch should start a new build or not.
    public let filesAndFoldersRule: CiFilesAndFoldersRule?
    /// The source branch name and custom patterns you configure for a workflow that starts a new build for changes to a branch.
    public let source: CiBranchPatterns?

    public init(autoCancel: Bool? = nil, filesAndFoldersRule: CiFilesAndFoldersRule? = nil, source: CiBranchPatterns? = nil) {
        self.autoCancel = autoCancel
        self.filesAndFoldersRule = filesAndFoldersRule
        self.source = source
    }
}
