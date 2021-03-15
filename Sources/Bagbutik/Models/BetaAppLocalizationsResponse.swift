import Foundation

/// A response that contains a list of Beta App Localization resources.
public struct BetaAppLocalizationsResponse: Codable {
    /// The resource data.
    public let data: [BetaAppLocalization]
    public let included: [App]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BetaAppLocalization], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
