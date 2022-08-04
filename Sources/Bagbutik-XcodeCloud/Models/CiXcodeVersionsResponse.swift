import Foundation
import Bagbutik_Core

/**
 # CiXcodeVersionsResponse
 A response that contains a list of Xcode Versions resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversionsresponse>
 */
public struct CiXcodeVersionsResponse: Codable, PagedResponse {
    public typealias Data = CiXcodeVersion

    /// The resource data.
    public let data: [CiXcodeVersion]
    /// The requested relationship data.
    public var included: [CiMacOsVersion]?
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [CiXcodeVersion],
                included: [CiMacOsVersion]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
