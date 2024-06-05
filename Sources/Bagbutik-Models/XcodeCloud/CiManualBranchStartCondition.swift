import Bagbutik_Core
import Foundation

public struct CiManualBranchStartCondition: Codable {
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
