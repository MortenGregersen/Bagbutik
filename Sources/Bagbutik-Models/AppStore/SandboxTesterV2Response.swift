import Bagbutik_Core
import Foundation

public struct SandboxTesterV2Response: Codable, Sendable {
    public let data: SandboxTesterV2
    public let links: DocumentLinks

    public init(data: SandboxTesterV2,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SandboxTesterV2.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
