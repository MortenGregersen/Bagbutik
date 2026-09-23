import BagbutikCore
import Foundation

/**
 # CiManualTagStartCondition

 A workflow start condition that triggers an Xcode Cloud build when a specified tag is manually selected.

 ```
 object CiManualTagStartCondition
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cimanualtagstartcondition>
 */
public struct CiManualTagStartCondition: Codable, Sendable {
    public var source: CiTagPatterns?

    public init(source: CiTagPatterns? = nil) {
        self.source = source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        source = try container.decodeIfPresent(CiTagPatterns.self, forKey: "source")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(source, forKey: "source")
    }
}
