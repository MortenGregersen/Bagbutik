import Foundation

/**
 A response that contains a list of AppInfoLocalizations resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfolocalizationsresponse>
 */
public struct AppInfoLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = AppInfoLocalization
    public let data: [AppInfoLocalization]
    public var included: [AppInfo]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppInfoLocalization], included: [AppInfo]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
