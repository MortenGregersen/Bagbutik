import BagbutikCore
import Foundation

/**
 # CiBuildActionResponse

 The response body for endpoints that read a single Xcode Cloud build action.

 ```
 object CiBuildActionResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildactionresponse>
 */
public struct CiBuildActionResponse: Codable, Sendable {
    public let data: CiBuildAction
    public var included: [CiBuildRun]?
    public let links: DocumentLinks

    public init(data: CiBuildAction,
                included: [CiBuildRun]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(CiBuildAction.self, forKey: "data")
        included = try container.decodeIfPresent([CiBuildRun].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
