import Foundation

/**
 A response that contains a list of AppInfoLocalizations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationsresponse>
 */
public struct AppInfoLocalizationsResponse: Codable {
    /// The resource data.
    public let data: [AppInfoLocalization]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppInfoLocalization], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
