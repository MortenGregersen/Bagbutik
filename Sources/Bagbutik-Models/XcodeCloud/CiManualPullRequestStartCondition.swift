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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        destination = try container.decodeIfPresent(CiBranchPatterns.self, forKey: .destination)
        source = try container.decodeIfPresent(CiBranchPatterns.self, forKey: .source)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(destination, forKey: .destination)
        try container.encodeIfPresent(source, forKey: .source)
    }

    private enum CodingKeys: String, CodingKey {
        case destination
        case source
    }
}
