import Foundation

/**
 Settings for a start condition that starts a build if a pull request changes.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cipullrequeststartcondition>
 */
public struct CiPullRequestStartCondition: Codable {
    /// A Boolean value that indicates whether Xcode Cloud automatically cancels or skips builds.
    public var autoCancel: Bool?
    /// The destination branch name and custom patterns you configure for a workflow that starts a new build for changes to a pull request.
    public var destination: CiBranchPatterns?
    /// The custom rule that determines whether Xcode Cloud starts a build or not based on a pull request’s changes to files.
    public var filesAndFoldersRule: CiFilesAndFoldersRule?
    /// The source branch name and custom patterns you configure for a workflow that starts a new build for changes to a pull request.
    public var source: CiBranchPatterns?

    public init(autoCancel: Bool? = nil, destination: CiBranchPatterns? = nil, filesAndFoldersRule: CiFilesAndFoldersRule? = nil, source: CiBranchPatterns? = nil) {
        self.autoCancel = autoCancel
        self.destination = destination
        self.filesAndFoldersRule = filesAndFoldersRule
        self.source = source
    }
}
