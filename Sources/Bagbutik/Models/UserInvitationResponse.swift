import Foundation

/// A response that contains a single User Invitations resource.
public struct UserInvitationResponse: Codable {
    /// The resource data.
    public let data: UserInvitation
    public let included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: UserInvitation, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
