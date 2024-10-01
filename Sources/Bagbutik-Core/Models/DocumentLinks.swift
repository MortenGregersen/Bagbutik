import Foundation

/**
 # DocumentLinks
 Self-links to documents that can contain information for one or more resources.

 All the response data constitutes a *document*.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/documentlinks>
 */
public struct DocumentLinks: Codable, Sendable {
    /// The link that produced the current document.
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
