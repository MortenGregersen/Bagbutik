import Foundation

public struct BetaBuildLocalizationsResponse: Codable {
    public let data: [BetaBuildLocalization]
    public let included: [Build]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [BetaBuildLocalization], included: [Build]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
