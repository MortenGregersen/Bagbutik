import Foundation

public struct HttpHeader: Codable, Sendable {
    public var name: String?
    public var value: String?

    public init(name: String? = nil,
                value: String? = nil)
    {
        self.name = name
        self.value = value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        name = try container.decodeIfPresent(String.self, forKey: "name")
        value = try container.decodeIfPresent(String.self, forKey: "value")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(value, forKey: "value")
    }
}
