import Bagbutik_Core
import Foundation

/**
 # CiManualTagStartCondition
 A workflow start condition that triggers an Xcode Cloud build when a specified tag is manually selected.

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
