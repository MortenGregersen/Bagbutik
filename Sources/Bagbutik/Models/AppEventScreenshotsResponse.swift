import Foundation

public struct AppEventScreenshotsResponse: Codable, PagedResponse {
    public typealias Data = AppEventScreenshot

    public let data: [AppEventScreenshot]
    public var included: [AppEventLocalization]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppEventScreenshot],
                included: [AppEventLocalization]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
