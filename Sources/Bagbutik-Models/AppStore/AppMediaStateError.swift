import Bagbutik_Core
import Foundation

public struct AppMediaStateError: Codable, Sendable {
    public var code: String?
    public var description: String?

    public init(code: String? = nil,
                description: String? = nil)
    {
        self.code = code
        self.description = description
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        code = try container.decodeIfPresent(String.self, forKey: "code")
        description = try container.decodeIfPresent(String.self, forKey: "description")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(code, forKey: "code")
        try container.encodeIfPresent(description, forKey: "description")
    }
}
