import Bagbutik_Core
import Foundation

public struct ActorsResponse: Codable, PagedResponse {
    public typealias Data = Actor

    public let data: [Actor]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Actor],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
