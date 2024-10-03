import Foundation

public struct PagedDocumentLinks: Codable, Sendable {
    public var first: String?
    public var next: String?
    public let itself: String

    public init(first: String? = nil,
                next: String? = nil,
                self itself: String)
    {
        self.first = first
        self.next = next
        self.itself = itself
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        first = try container.decodeIfPresent(String.self, forKey: "first")
        next = try container.decodeIfPresent(String.self, forKey: "next")
        itself = try container.decode(String.self, forKey: "self")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(first, forKey: "first")
        try container.encodeIfPresent(next, forKey: "next")
        try container.encode(itself, forKey: "self")
    }
}
