import Foundation

/**
 A response that contains a list of Certificates resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificatesresponse>
 */
public struct CertificatesResponse: Codable, PagedResponse {
    public typealias Data = Certificate
    /// The resource data.
    public let data: [Certificate]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information
    public var meta: PagingInformation?

    public init(data: [Certificate], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
