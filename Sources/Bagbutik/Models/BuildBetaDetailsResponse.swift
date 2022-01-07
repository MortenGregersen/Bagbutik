import Foundation

/**
 A response that contains a list of Build Beta Detail resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailsresponse>
 */
public struct BuildBetaDetailsResponse: Codable, PagedResponse {
    public typealias Data = BuildBetaDetail
    /// The resource data.
    public let data: [BuildBetaDetail]
    /// The included related resources.
    @NullCodable public var included: [Build]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [BuildBetaDetail], included: [Build]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
