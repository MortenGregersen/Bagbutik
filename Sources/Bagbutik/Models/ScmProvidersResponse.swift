import Foundation

/**
 A response that contains a list of Providers resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmprovidersresponse>
 */
public struct ScmProvidersResponse: Codable, PagedResponse {
    public typealias Data = ScmProvider
    /// The resource data.
    public let data: [ScmProvider]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [ScmProvider], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
