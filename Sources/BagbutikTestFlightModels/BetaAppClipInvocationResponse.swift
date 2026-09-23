import BagbutikCore
import Foundation

/**
 # BetaAppClipInvocationResponse

 A response containing a single TestFlight App Clip invocation URL.

 ```
 object BetaAppClipInvocationResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationresponse>
 */
public struct BetaAppClipInvocationResponse: Codable, Sendable {
    public let data: BetaAppClipInvocation
    public var included: [BetaAppClipInvocationLocalization]?
    public let links: DocumentLinks

    public init(data: BetaAppClipInvocation,
                included: [BetaAppClipInvocationLocalization]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaAppClipInvocation.self, forKey: "data")
        included = try container.decodeIfPresent([BetaAppClipInvocationLocalization].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
