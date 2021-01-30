import Foundation

public struct UsersResponse: Codable {
    public let data: [User]
    public let included: [App]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [User], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
