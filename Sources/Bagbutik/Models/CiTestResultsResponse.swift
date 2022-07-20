import Foundation

/**
 A response that contains a list of Test Results resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citestresultsresponse>
 */
public struct CiTestResultsResponse: Codable, PagedResponse {
    public typealias Data = CiTestResult
    /// The resource data.
    public let data: [CiTestResult]
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [CiTestResult], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
