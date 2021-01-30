import Foundation

public struct BetaAppLocalizationsResponse: Codable {
    public let data: [BetaAppLocalization]
    public let included: [App]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [BetaAppLocalization], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
