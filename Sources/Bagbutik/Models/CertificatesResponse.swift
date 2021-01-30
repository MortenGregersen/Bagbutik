import Foundation

public struct CertificatesResponse: Codable {
    public let data: [Certificate]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [Certificate], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
