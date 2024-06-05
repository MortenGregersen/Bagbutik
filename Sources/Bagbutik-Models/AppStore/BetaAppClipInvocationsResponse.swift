import Bagbutik_Core
import Foundation

/**
 # BetaAppClipInvocationsResponse
 A response that contains a list of Beta App Clip Invocations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationsresponse>
 */
public struct BetaAppClipInvocationsResponse: Codable, PagedResponse {
    public typealias Data = BetaAppClipInvocation

    /// The resource data.
    public let data: [BetaAppClipInvocation]
    /// The requested relationship data.
    public var included: [BetaAppClipInvocationLocalization]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
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
}
