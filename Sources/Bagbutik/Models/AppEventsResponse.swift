import Foundation

public struct AppEventsResponse: Codable, PagedResponse {
    public typealias Data = AppEvent
    /// The resource data.
    public let data: [AppEvent]
    /// The included related resources.
    @NullCodable public var included: [AppEventLocalization]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [AppEvent], included: [AppEventLocalization]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
