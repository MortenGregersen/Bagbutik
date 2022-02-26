import Foundation

public struct AppEventScreenshotsResponse: Codable, PagedResponse {
    public typealias Data = AppEventScreenshot
    /// The resource data.
    public let data: [AppEventScreenshot]
    /// The included related resources.
    @NullCodable public var included: [AppEventLocalization]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [AppEventScreenshot], included: [AppEventLocalization]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
