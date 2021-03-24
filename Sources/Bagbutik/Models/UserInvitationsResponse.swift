import Foundation

/**
 A response that contains a list of User Invitations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/userinvitationsresponse>
 */
public struct UserInvitationsResponse: Codable {
    /// The resource data.
    public let data: [UserInvitation]
    /// The included related resources.
    public let included: [App]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [UserInvitation], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
