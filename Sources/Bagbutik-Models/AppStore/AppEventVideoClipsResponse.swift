import Bagbutik_Core
import Foundation

public struct AppEventVideoClipsResponse: Codable, PagedResponse {
    public typealias Data = AppEventVideoClip

    public let data: [AppEventVideoClip]
    public var included: [AppEventLocalization]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppEventVideoClip],
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
