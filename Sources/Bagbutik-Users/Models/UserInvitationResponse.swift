import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # UserInvitationResponse
 The response body for endpoints that read or modify a pending App Store Connect team invitation.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/userinvitationresponse>
 */
public struct UserInvitationResponse: Codable, Sendable {
    /// The resource data.
    public let data: UserInvitation
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: UserInvitation,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(UserInvitation.self, forKey: "data")
        included = try container.decodeIfPresent([App].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
