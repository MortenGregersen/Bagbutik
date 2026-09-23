import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # UsersResponse

 A response containing a list of team members who have access to your App Store Connect account.

 ```
 object UsersResponse
 ```

 ## See Also

 [`List users`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-users)

 Get a list of the users on your team.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/usersresponse>
 */
public struct UsersResponse: Codable, Sendable, PagedResponse {
    public typealias Data = User

    public let data: [User]
    public var included: [App]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [User],
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
        data = try container.decode([User].self, forKey: "data")
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

    public func getVisibleApps(for user: User) -> [App] {
        guard let visibleAppIds = user.relationships?.visibleApps?.data?.map(\.id) else { return [] }
        return included?.filter { visibleAppIds.contains($0.id) } ?? []
    }
}
