import BagbutikCore
import Foundation

/**
 # SandboxTestersClearPurchaseHistoryRequestV2Response

 A response confirming that the purchase history for sandbox testers was cleared.

 ```
 object SandboxTestersClearPurchaseHistoryRequestV2Response
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/sandboxtestersclearpurchasehistoryrequestv2response>
 */
public struct SandboxTestersClearPurchaseHistoryRequestV2Response: Codable, Sendable {
    public let data: SandboxTestersClearPurchaseHistoryRequestV2
    public let links: DocumentLinks

    public init(data: SandboxTestersClearPurchaseHistoryRequestV2,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SandboxTestersClearPurchaseHistoryRequestV2.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
