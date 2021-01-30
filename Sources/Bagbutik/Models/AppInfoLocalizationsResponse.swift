import Foundation

public struct AppInfoLocalizationsResponse: Codable {
    public let data: [AppInfoLocalization]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [AppInfoLocalization], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
