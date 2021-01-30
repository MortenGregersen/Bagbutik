import Foundation

public struct GameCenterEnabledVersionsResponse: Codable {
    public let data: [GameCenterEnabledVersion]
    public let included: [GameCenterEnabledVersion]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [GameCenterEnabledVersion], included: [GameCenterEnabledVersion]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
