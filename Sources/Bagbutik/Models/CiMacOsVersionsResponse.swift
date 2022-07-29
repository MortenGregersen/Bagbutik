import Foundation

/**
 # CiMacOsVersionsResponse
 A response that contains a list of macOS Versions resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversionsresponse>
 */
public struct CiMacOsVersionsResponse: Codable, PagedResponse {
    public typealias Data = CiMacOsVersion

    /// The resource data.
    public let data: [CiMacOsVersion]
    /// The requested relationship data.
    public var included: [CiXcodeVersion]?
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [CiMacOsVersion],
                included: [CiXcodeVersion]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
