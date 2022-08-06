import Bagbutik_Core
import Foundation

/**
 # BuildBundleFileSizesResponse
 A response that contains a list of Build Bundle File Sizes resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbundlefilesizesresponse>
 */
public struct BuildBundleFileSizesResponse: Codable, PagedResponse {
    public typealias Data = BuildBundleFileSize

    /// The resource data.
    public let data: [BuildBundleFileSize]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [BuildBundleFileSize],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
