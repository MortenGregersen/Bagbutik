import BagbutikCore
import Foundation

/**
 # CiXcodeVersionResponse

 The response body for endpoints that read a single Xcode version available in Xcode Cloud.

 ```
 object CiXcodeVersionResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversionresponse>
 */
public struct CiXcodeVersionResponse: Codable, Sendable {
    public let data: CiXcodeVersion
    public var included: [CiMacOsVersion]?
    public let links: DocumentLinks

    public init(data: CiXcodeVersion,
                included: [CiMacOsVersion]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(CiXcodeVersion.self, forKey: "data")
        included = try container.decodeIfPresent([CiMacOsVersion].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
