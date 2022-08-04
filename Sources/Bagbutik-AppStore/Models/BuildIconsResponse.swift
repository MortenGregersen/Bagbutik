import Foundation
import Bagbutik_Core

/**
 # BuildIconsResponse
 A response that contains a list of Build Icon resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildiconsresponse>
 */
public struct BuildIconsResponse: Codable, PagedResponse {
    public typealias Data = BuildIcon

    public let data: [BuildIcon]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BuildIcon],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
