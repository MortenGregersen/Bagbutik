import Foundation

/**
 A response that contains a list of Build Icon resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildiconsresponse>
 */
public struct BuildIconsResponse: Codable, PagedResponse {
    public typealias Data = BuildIcon
    /// The resource data.
    public let data: [BuildIcon]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [BuildIcon], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
