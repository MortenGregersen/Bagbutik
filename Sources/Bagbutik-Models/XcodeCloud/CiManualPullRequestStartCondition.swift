import Bagbutik_Core
import Foundation

public struct CiManualPullRequestStartCondition: Codable {
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
