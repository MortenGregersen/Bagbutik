import Foundation

/**
 # PagedDocumentLinks
 Links related to the response document, including paging links.

 All the response data constitutes multiple *documents.*

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/pageddocumentlinks>
 */
public struct PagedDocumentLinks: Codable {
    /// The link to the first page of documents.
    public var first: String?
    /// The link to the next page of documents.
    public var next: String?
    /// The link that produced the current document.
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
