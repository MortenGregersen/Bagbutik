import Foundation

/**
 A response that contains a list of macOS Versions resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cimacosversionsresponse>
 */
public struct CiMacOsVersionsResponse: Codable, PagedResponse {
    public typealias Data = CiMacOsVersion
    /// The resource data.
    public let data: [CiMacOsVersion]
    /// The included related resources.
    @NullCodable public var included: [CiXcodeVersion]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [CiMacOsVersion], included: [CiXcodeVersion]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
