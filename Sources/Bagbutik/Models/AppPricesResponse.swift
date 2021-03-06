import Foundation

/**
 A response that contains a list of App Prices resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricesresponse>
 */
public struct AppPricesResponse: Codable {
    /// The resource data.
    public let data: [AppPrice]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [AppPrice], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
