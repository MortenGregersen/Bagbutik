import Foundation

/**
 Self-links to documents that can contain information for one or more resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/documentlinks>

 All the response data constitutes a document.
 */
public struct DocumentLinks: Codable {
    /// The link that produced the current document.
    public let `self`: String

    public init(self aSelf: String) {
        self.`self` = aSelf
    }
}
