import Foundation

public struct AppEncryptionDeclarationsResponse: Codable {
    public let data: [AppEncryptionDeclaration]
    public let included: [App]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppEncryptionDeclaration], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
