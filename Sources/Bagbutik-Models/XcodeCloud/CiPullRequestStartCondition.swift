import Bagbutik_Core
import Foundation

/**
 # CiPullRequestStartCondition
 Settings for a start condition that starts a build if a pull request changes.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cipullrequeststartcondition>
 */
public struct CiPullRequestStartCondition: Codable, Sendable {
    /// A Boolean value that indicates whether Xcode Cloud automatically cancels or skips builds.
    public var autoCancel: Bool?
    /// The destination branch name and custom patterns you configure for a workflow that starts a new build for changes to a pull request.
    public var destination: CiBranchPatterns?
    /// The custom rule that determines whether Xcode Cloud starts a build or not based on a pull request’s changes to files.
    public var filesAndFoldersRule: CiFilesAndFoldersRule?
    /// The source branch name and custom patterns you configure for a workflow that starts a new build for changes to a pull request.
    public var source: CiBranchPatterns?

    public init(autoCancel: Bool? = nil,
                destination: CiBranchPatterns? = nil,
                filesAndFoldersRule: CiFilesAndFoldersRule? = nil,
                source: CiBranchPatterns? = nil)
    {
        self.autoCancel = autoCancel
        self.destination = destination
        self.filesAndFoldersRule = filesAndFoldersRule
        self.source = source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        autoCancel = try container.decodeIfPresent(Bool.self, forKey: "autoCancel")
        destination = try container.decodeIfPresent(CiBranchPatterns.self, forKey: "destination")
        filesAndFoldersRule = try container.decodeIfPresent(CiFilesAndFoldersRule.self, forKey: "filesAndFoldersRule")
        source = try container.decodeIfPresent(CiBranchPatterns.self, forKey: "source")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(autoCancel, forKey: "autoCancel")
        try container.encodeIfPresent(destination, forKey: "destination")
        try container.encodeIfPresent(filesAndFoldersRule, forKey: "filesAndFoldersRule")
        try container.encodeIfPresent(source, forKey: "source")
    }
}
