import Bagbutik_Core
import Foundation

/**
 # TerritoriesResponse
 A response that contains a list of Territory resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/territoriesresponse>
 */
public struct TerritoriesResponse: Codable, PagedResponse {
    public typealias Data = Territory

    public let data: [Territory]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Territory],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
