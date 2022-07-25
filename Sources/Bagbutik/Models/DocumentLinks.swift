import Foundation

/**
 Self-links to documents that can contain information for one or more resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/documentlinks>

 All the response data constitutes a *document*.
 */
public struct DocumentLinks: Codable {
    /// The link that produced the current document.
    public let itself: String

    public init(self itself: String) {
        self.itself = itself
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        itself = try container.decode(String.self, forKey: .itself)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(itself, forKey: .itself)
    }

    private enum CodingKeys: String, CodingKey {
        case itself = "self"
    }
}
