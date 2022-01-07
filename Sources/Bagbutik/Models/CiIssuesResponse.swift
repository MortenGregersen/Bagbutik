import Foundation

/**
 A response that contains a list of Issues resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciissuesresponse>
 */
public struct CiIssuesResponse: Codable, PagedResponse {
    public typealias Data = CiIssue
    /// The resource data.
    public let data: [CiIssue]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [CiIssue], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
