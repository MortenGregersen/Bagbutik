import Foundation

public struct BetaTesterInvitationResponse: Codable {
    public let data: BetaTesterInvitation
    public let links: DocumentLinks

    public init(data: BetaTesterInvitation, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
