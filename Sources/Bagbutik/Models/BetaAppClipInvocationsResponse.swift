import Foundation

/**
 A response that contains a list of Beta App Clip Invocations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationsresponse>
 */
public struct BetaAppClipInvocationsResponse: Codable, PagedResponse {
    public typealias Data = BetaAppClipInvocation
    /// The resource data.
    public let data: [BetaAppClipInvocation]
    /// The included related resources.
    public let included: [BetaAppClipInvocationLocalization]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BetaAppClipInvocation], included: [BetaAppClipInvocationLocalization]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
