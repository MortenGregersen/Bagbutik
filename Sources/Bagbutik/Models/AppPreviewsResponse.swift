import Foundation

/**
 A response that contains a list of App Preview resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsresponse>
 */
public struct AppPreviewsResponse: Codable, PagedResponse {
    public typealias Data = AppPreview
    /// The resource data.
    public let data: [AppPreview]
    /// The included related resources.
    public let included: [AppPreviewSet]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppPreview], included: [AppPreviewSet]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
