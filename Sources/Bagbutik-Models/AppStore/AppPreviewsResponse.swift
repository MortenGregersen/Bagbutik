import Bagbutik_Core
import Foundation

/**
 # AppPreviewsResponse
 A response that contains a list of App Preview resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsresponse>
 */
public struct AppPreviewsResponse: Codable, PagedResponse {
    public typealias Data = AppPreview

    public let data: [AppPreview]
    public var included: [AppPreviewSet]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppPreview],
                included: [AppPreviewSet]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
