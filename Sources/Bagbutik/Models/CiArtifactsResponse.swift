import Foundation

/**
 A response that contains a list of Artifacts resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciartifactsresponse>
 */
public struct CiArtifactsResponse: Codable, PagedResponse {
    public typealias Data = CiArtifact
    /// The resource data.
    public let data: [CiArtifact]
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [CiArtifact], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
