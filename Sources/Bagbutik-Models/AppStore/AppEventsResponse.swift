import Bagbutik_Core
import Foundation

public struct AppEventsResponse: Codable, PagedResponse {
    public typealias Data = AppEvent

    public let data: [AppEvent]
    public var included: [AppEventLocalization]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppEvent],
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
