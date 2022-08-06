import Bagbutik_Core
import Foundation

/**
 # BetaTesterInvitationResponse
 A response that contains a single Beta Tester Invitations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatesterinvitationresponse>
 */
public struct BetaTesterInvitationResponse: Codable {
    /// The resource data.
    public let data: BetaTesterInvitation
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaTesterInvitation,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
