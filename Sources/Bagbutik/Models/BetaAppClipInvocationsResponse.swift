import Foundation

public struct BetaAppClipInvocationsResponse: Codable, PagedResponse {
    public typealias Data = BetaAppClipInvocation
    public let data: [BetaAppClipInvocation]
    public let included: [BetaAppClipInvocationLocalization]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [BetaAppClipInvocation], included: [BetaAppClipInvocationLocalization]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
