import Foundation

public struct BuildBetaDetailsResponse: Codable {
    public let data: [BuildBetaDetail]
    public let included: [Build]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [BuildBetaDetail], included: [Build]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
