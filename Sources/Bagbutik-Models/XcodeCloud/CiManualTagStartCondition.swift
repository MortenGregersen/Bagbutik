import Bagbutik_Core
import Foundation

public struct CiManualTagStartCondition: Codable {
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
