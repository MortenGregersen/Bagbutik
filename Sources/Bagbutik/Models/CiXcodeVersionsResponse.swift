import Foundation

/**
 A response that contains a list of Xcode Versions resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cixcodeversionsresponse>
 */
public struct CiXcodeVersionsResponse: Codable, PagedResponse {
    public typealias Data = CiXcodeVersion
    /// The resource data.
    public let data: [CiXcodeVersion]
    /// The included related resources.
    @NullCodable public var included: [CiMacOsVersion]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [CiXcodeVersion], included: [CiMacOsVersion]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
