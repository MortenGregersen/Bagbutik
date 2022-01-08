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
    public let `self`: String

    public init(first: String? = nil, next: String? = nil, self aSelf: String) {
        self.first = first
        self.next = next
        self.`self` = aSelf
    }
}
