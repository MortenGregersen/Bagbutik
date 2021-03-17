import Foundation

/// Links related to the response document, including paging links.
public struct PagedDocumentLinks: Codable {
    /// The link to the first page of documents.
    public let first: String?
    /// The link to the next page of documents.
    public let next: String?
    /// The link that produced the current document.
    public let `self`: String

    public init(first: String? = nil, next: String? = nil, self aSelf: String) {
        self.first = first
        self.next = next
        self.`self` = aSelf
    }
}
