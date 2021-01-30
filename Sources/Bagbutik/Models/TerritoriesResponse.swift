import Foundation

public struct TerritoriesResponse: Codable {
    public let data: [Territory]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [Territory], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
