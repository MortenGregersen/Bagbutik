import Foundation

public struct DocumentLinks: Codable, Sendable {
    public let itself: String

    public init(self itself: String) {
        self.itself = itself
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        itself = try container.decode(String.self, forKey: "self")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(itself, forKey: "self")
    }
}
