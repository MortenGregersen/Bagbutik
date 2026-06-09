import Bagbutik_Core
import Foundation

/**
 # CiManualBranchStartCondition
 A workflow start condition that triggers an Xcode Cloud build when a specified branch is manually selected.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cimanualbranchstartcondition>
 */
public struct CiManualBranchStartCondition: Codable, Sendable {
    public var source: CiBranchPatterns?

    public init(source: CiBranchPatterns? = nil) {
        self.source = source
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        source = try container.decodeIfPresent(CiBranchPatterns.self, forKey: "source")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(source, forKey: "source")
    }
}
