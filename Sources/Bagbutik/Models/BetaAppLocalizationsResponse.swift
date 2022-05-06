import Foundation

/**
 A response that contains a list of Beta App Localization resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationsresponse>
 */
public struct BetaAppLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = BetaAppLocalization
    /// The resource data.
    public let data: [BetaAppLocalization]
    /// The included related resources.
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [BetaAppLocalization], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
