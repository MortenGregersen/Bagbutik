import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # UserInvitationsResponse
 A response that contains a list of User Invitations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/userinvitationsresponse>
 */
public struct UserInvitationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = UserInvitation

    /// The resource data.
    public let data: [UserInvitation]
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [UserInvitation],
                included: [App]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([UserInvitation].self, forKey: "data")
        included = try container.decodeIfPresent([App].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getVisibleApps(for userInvitation: UserInvitation) -> [App] {
        guard let visibleAppIds = userInvitation.relationships?.visibleApps?.data?.map(\.id) else { return [] }
        return included?.filter { visibleAppIds.contains($0.id) } ?? []
    }
}
