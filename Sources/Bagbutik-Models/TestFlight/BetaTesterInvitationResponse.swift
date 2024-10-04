import Bagbutik_Core
import Foundation

/**
 # BetaTesterInvitationResponse
 A response that contains a single Beta Tester Invitations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatesterinvitationresponse>
 */
public struct BetaTesterInvitationResponse: Codable, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaTesterInvitation.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
