import Foundation

/// A response that contains a list of Build Icon resources.
public struct BuildIconsResponse: Codable {
    /// The resource data.
    public let data: [BuildIcon]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BuildIcon], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
