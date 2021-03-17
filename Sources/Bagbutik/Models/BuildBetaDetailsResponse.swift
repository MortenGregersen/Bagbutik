import Foundation

/**
 A response that contains a list of Build Beta Detail resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailsresponse>
 */
public struct BuildBetaDetailsResponse: Codable {
    /// The resource data.
    public let data: [BuildBetaDetail]
    public let included: [Build]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BuildBetaDetail], included: [Build]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
