import Foundation

public struct UserInvitationResponse: Codable {
    public let data: UserInvitation
    public let included: [App]?
    public let links: DocumentLinks

    public init(data: UserInvitation, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
