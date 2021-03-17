import Foundation

/**
 A response that contains a list of App Preview resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsresponse>
 */
public struct AppPreviewsResponse: Codable {
    /// The resource data.
    public let data: [AppPreview]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppPreview], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
