import BagbutikCore
import Foundation

/**
 # CiPullRequestStartCondition

 Settings for a start condition that starts a build if a pull request changes.

 ```
 object CiPullRequestStartCondition
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cipullrequeststartcondition>
 */
public struct CiPullRequestStartCondition: Codable, Sendable {
    public var autoCancel: Bool?
    public var destination: CiBranchPatterns?
    public var filesAndFoldersRule: CiFilesAndFoldersRule?
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
