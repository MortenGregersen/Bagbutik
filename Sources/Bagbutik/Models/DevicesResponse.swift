import Foundation

/// A response that contains a list of Devices resources.
public struct DevicesResponse: Codable {
    /// The resource data.
    public let data: [Device]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [Device], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
