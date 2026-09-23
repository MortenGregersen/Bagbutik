import BagbutikCore
import Foundation

/**
 # ScmGitReferencesResponse

 The response body for endpoints that list Git references in an Xcode Cloud repository.

 ```
 object ScmGitReferencesResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmgitreferencesresponse>
 */
public struct ScmGitReferencesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = ScmGitReference

    public let data: [ScmGitReference]
    public var included: [ScmRepository]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [ScmGitReference],
                included: [ScmRepository]? = nil,
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
        data = try container.decode([ScmGitReference].self, forKey: "data")
        included = try container.decodeIfPresent([ScmRepository].self, forKey: "included")
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

    public func getRepository(for scmGitReference: ScmGitReference) -> ScmRepository? {
        included?.first { $0.id == scmGitReference.relationships?.repository?.data?.id }
    }
}
