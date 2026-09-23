import BagbutikCore
import Foundation

/**
 # CiManualPullRequestStartCondition

 A workflow start condition that triggers an Xcode Cloud build for a manually specified pull request.

 ```
 object CiManualPullRequestStartCondition
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cimanualpullrequeststartcondition>
 */
public struct CiManualPullRequestStartCondition: Codable, Sendable {
    public var destination: CiBranchPatterns?
    public var source: CiBranchPatterns?

    public init(destination: CiBranchPatterns? = nil,
                source: CiBranchPatterns? = nil)
    {
        self.destination = destination
        self.source = source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        destination = try container.decodeIfPresent(CiBranchPatterns.self, forKey: "destination")
        source = try container.decodeIfPresent(CiBranchPatterns.self, forKey: "source")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(destination, forKey: "destination")
        try container.encodeIfPresent(source, forKey: "source")
    }
}
