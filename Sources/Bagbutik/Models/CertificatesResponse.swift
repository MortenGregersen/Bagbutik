import Foundation

/// A response that contains a list of Certificates resources.
public struct CertificatesResponse: Codable {
    /// The resource data.
    public let data: [Certificate]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [Certificate], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
