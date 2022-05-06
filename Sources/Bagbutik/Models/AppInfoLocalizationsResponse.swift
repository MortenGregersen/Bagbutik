import Foundation

/**
 A response that contains a list of AppInfoLocalizations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationsresponse>
 */
public struct AppInfoLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = AppInfoLocalization
    /// The resource data.
    public let data: [AppInfoLocalization]
    /// The included related resources.
    public var included: [AppInfo]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [AppInfoLocalization], included: [AppInfo]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
