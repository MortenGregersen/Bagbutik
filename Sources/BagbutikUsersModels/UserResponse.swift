import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # UserResponse

 The response body for endpoints that read or modify a single App Store Connect team member.

 ```
 object UserResponse
 ```

 ## See Also

 [`Read user information`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-users-_id_)

 Get information about a user on your team, such as name, roles, and app visibility.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/userresponse>
 */
public struct UserResponse: Codable, Sendable {
    public let data: User
    public var included: [App]?
    public let links: DocumentLinks

    public init(data: User,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(User.self, forKey: "data")
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
