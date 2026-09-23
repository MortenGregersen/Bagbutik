import BagbutikCore
import Foundation

/**
 # BetaTesterInvitationResponse

 The response body for the endpoint that sends a TestFlight invitation to a beta tester.

 ```
 object BetaTesterInvitationResponse
 ```

 ## See Also

 [`Send an invitation to a beta tester`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-betaTesterInvitations)

 Send or resend an invitation to a beta tester to test a specified app.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betatesterinvitationresponse>
 */
public struct BetaTesterInvitationResponse: Codable, Sendable {
    public let data: BetaTesterInvitation
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
