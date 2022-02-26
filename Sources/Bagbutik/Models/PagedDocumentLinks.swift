import Foundation

/**
 Links related to the response document, including paging links.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/pageddocumentlinks>

 All the response data constitutes a document.
 */
public struct PagedDocumentLinks: Codable {
    /// The link to the first page of documents.
    public var first: String?
    /// The link to the next page of documents.
    public var next: String?
    /// The link that produced the current document.
    public let itself: String

    public init(first: String? = nil, next: String? = nil, self itself: String) {
        self.first = first
        self.next = next
        self.itself = itself
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        first = try container.decodeIfPresent(String.self, forKey: .first)
        next = try container.decodeIfPresent(String.self, forKey: .next)
        itself = try container.decode(String.self, forKey: .itself)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(first, forKey: .first)
        try container.encodeIfPresent(next, forKey: .next)
        try container.encode(itself, forKey: .itself)
    }

    private enum CodingKeys: String, CodingKey {
        case first
        case next
        case itself = "self"
    }
}
