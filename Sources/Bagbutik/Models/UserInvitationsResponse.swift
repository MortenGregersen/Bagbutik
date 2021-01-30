import Foundation

public struct UserInvitationsResponse: Codable {
    public let data: [UserInvitation]
    public let included: [App]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [UserInvitation], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
