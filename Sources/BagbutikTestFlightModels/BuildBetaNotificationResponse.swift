import BagbutikCore
import Foundation

/**
 # BuildBetaNotificationResponse

 The response body for the endpoint that sends a beta test notification for a build.

 ```
 object BuildBetaNotificationResponse
 ```

 ## See Also

 [`Send notification of an available build`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-buildBetaNotifications)

 Send a notification to all assigned beta testers that a build is available for testing.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetanotificationresponse>
 */
public struct BuildBetaNotificationResponse: Codable, Sendable {
    public let data: BuildBetaNotification
    public let links: DocumentLinks

    public init(data: BuildBetaNotification,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BuildBetaNotification.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
