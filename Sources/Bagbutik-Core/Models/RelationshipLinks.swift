import Foundation

public struct RelationshipLinks: Codable, Sendable {
    public var related: String?
    public var itself: String?

    public init(related: String? = nil,
                self itself: String? = nil)
    {
        self.related = related
        self.itself = itself
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        related = try container.decodeIfPresent(String.self, forKey: "related")
        itself = try container.decodeIfPresent(String.self, forKey: "self")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(related, forKey: "related")
        try container.encodeIfPresent(itself, forKey: "self")
    }
}
