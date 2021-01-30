import Foundation

public struct PagedDocumentLinks: Codable {
    public let first: String?
    public let next: String?
    public let `self`: String

    public init(first: String? = nil, next: String? = nil, self aSelf: String) {
        self.first = first
        self.next = next
        self.`self` = aSelf
    }
}
