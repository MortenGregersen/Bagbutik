import Foundation

/// A response that contains a list of Beta Build Localization resources.
public struct BetaBuildLocalizationsResponse: Codable {
    /// The resource data.
    public let data: [BetaBuildLocalization]
    public let included: [Build]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BetaBuildLocalization], included: [Build]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
