import Foundation

public struct BuildIconsResponse: Codable {
    public let data: [BuildIcon]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [BuildIcon], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
