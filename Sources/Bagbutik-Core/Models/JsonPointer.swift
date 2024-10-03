import Foundation

public struct JsonPointer: Codable, Sendable {
    public let pointer: String

    public init(pointer: String) {
        self.pointer = pointer
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        pointer = try container.decode(String.self, forKey: "pointer")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(pointer, forKey: "pointer")
    }
}
