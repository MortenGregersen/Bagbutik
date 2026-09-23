import BagbutikCore
import Foundation

/**
 # ScmGitReferenceResponse

 The response body for endpoints that read a single SCM Git reference in Xcode Cloud.

 ```
 object ScmGitReferenceResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmgitreferenceresponse>
 */
public struct ScmGitReferenceResponse: Codable, Sendable {
    public let data: ScmGitReference
    public var included: [ScmRepository]?
    public let links: DocumentLinks

    public init(data: ScmGitReference,
                included: [ScmRepository]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(ScmGitReference.self, forKey: "data")
        included = try container.decodeIfPresent([ScmRepository].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
