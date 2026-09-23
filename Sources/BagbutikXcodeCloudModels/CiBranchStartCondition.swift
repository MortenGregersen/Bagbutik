import BagbutikCore
import Foundation

/**
 # CiBranchStartCondition

 Settings for a start condition that starts a build if a branch changes.

 ```
 object CiBranchStartCondition
 ```

 ## Topics

 ### Objects

 [`object CiBranchPatterns`](https://developer.apple.com/documentation/AppStoreConnectAPI/CiBranchPatterns)

 Case-sensitive patterns Xcode Cloud uses to determine if a change meets branch names you configure for a workflow’s start condition.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibranchstartcondition>
 */
public struct CiBranchStartCondition: Codable, Sendable {
    public var autoCancel: Bool?
    public var filesAndFoldersRule: CiFilesAndFoldersRule?
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
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        autoCancel = try container.decodeIfPresent(Bool.self, forKey: "autoCancel")
        filesAndFoldersRule = try container.decodeIfPresent(CiFilesAndFoldersRule.self, forKey: "filesAndFoldersRule")
        source = try container.decodeIfPresent(CiBranchPatterns.self, forKey: "source")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(autoCancel, forKey: "autoCancel")
        try container.encodeIfPresent(filesAndFoldersRule, forKey: "filesAndFoldersRule")
        try container.encodeIfPresent(source, forKey: "source")
    }
}
