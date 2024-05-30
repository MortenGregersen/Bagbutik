import Bagbutik_Core
import Foundation

/**
 # CiBranchStartCondition
 Settings for a start condition that starts a build if a branch changes.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibranchstartcondition>
 */
public struct CiBranchStartCondition: Codable {
    /// A Boolean value that indicates whether Xcode Cloud automatically cancels or skips builds.
    public var autoCancel: Bool?
    /// Settings Xcode Cloud uses to determine whether a change to a branch should start a new build or not.
    public var filesAndFoldersRule: CiFilesAndFoldersRule?
    /// The source branch name and custom patterns you configure for a workflow that starts a new build for changes to a branch.
    public var source: CiBranchPatterns?

    public init(autoCancel: Bool? = nil,
                filesAndFoldersRule: CiFilesAndFoldersRule? = nil,
                source: CiBranchPatterns? = nil)
    {
        self.autoCancel = autoCancel
        self.filesAndFoldersRule = filesAndFoldersRule
        self.source = source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        autoCancel = try container.decodeIfPresent(Bool.self, forKey: .autoCancel)
        filesAndFoldersRule = try container.decodeIfPresent(CiFilesAndFoldersRule.self, forKey: .filesAndFoldersRule)
        source = try container.decodeIfPresent(CiBranchPatterns.self, forKey: .source)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(autoCancel, forKey: .autoCancel)
        try container.encodeIfPresent(filesAndFoldersRule, forKey: .filesAndFoldersRule)
        try container.encodeIfPresent(source, forKey: .source)
    }

    private enum CodingKeys: String, CodingKey {
        case autoCancel
        case filesAndFoldersRule
        case source
    }
}
