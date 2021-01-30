import Foundation

public struct DevicesResponse: Codable {
    public let data: [Device]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [Device], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
