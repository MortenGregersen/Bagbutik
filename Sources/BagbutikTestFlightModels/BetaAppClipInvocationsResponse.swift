import BagbutikCore
import Foundation

/**
 # BetaAppClipInvocationsResponse

 A response containing a list of TestFlight App Clip invocations for a beta build.

 ```
 object BetaAppClipInvocationsResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationsresponse>
 */
public struct BetaAppClipInvocationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BetaAppClipInvocation

    public let data: [BetaAppClipInvocation]
    public var included: [BetaAppClipInvocationLocalization]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BetaAppClipInvocation],
                included: [BetaAppClipInvocationLocalization]? = nil,
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
        data = try container.decode([BetaAppClipInvocation].self, forKey: "data")
        included = try container.decodeIfPresent([BetaAppClipInvocationLocalization].self, forKey: "included")
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

    public func getBetaAppClipInvocationLocalizations(for betaAppClipInvocation: BetaAppClipInvocation) -> [BetaAppClipInvocationLocalization] {
        guard let betaAppClipInvocationLocalizationIds = betaAppClipInvocation.relationships?.betaAppClipInvocationLocalizations?.data?.map(\.id) else { return [] }
        return included?.filter { betaAppClipInvocationLocalizationIds.contains($0.id) } ?? []
    }
}
