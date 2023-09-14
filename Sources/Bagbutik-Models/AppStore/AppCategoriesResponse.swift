import Bagbutik_Core
import Foundation

/**
 # AppCategoriesResponse
 A response that contains a list of App Category resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appcategoriesresponse>
 */
public struct AppCategoriesResponse: Codable, PagedResponse {
    public typealias Data = AppCategory

    public let data: [AppCategory]
    public var included: [AppCategory]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppCategory],
                included: [AppCategory]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
