import Foundation

/**
 A response that contains a list of Game Center Enabled Version resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterenabledversionsresponse>
 */
public struct GameCenterEnabledVersionsResponse: Codable {
    /// The resource data.
    public let data: [GameCenterEnabledVersion]
    public let included: [GameCenterEnabledVersion]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [GameCenterEnabledVersion], included: [GameCenterEnabledVersion]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
