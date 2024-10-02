import Bagbutik_Core
import Foundation

public struct Property: Codable, Sendable {
    public var key: String?
    public var value: String?

    public init(key: String? = nil,
                value: String? = nil)
    {
        self.key = key
        self.value = value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        key = try container.decodeIfPresent(String.self, forKey: "key")
        value = try container.decodeIfPresent(String.self, forKey: "value")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(key, forKey: "key")
        try container.encodeIfPresent(value, forKey: "value")
    }
}
