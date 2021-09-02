import Foundation

/**
 A response that contains a list of Diagnostic Logs resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticlogsresponse>
 */
public struct DiagnosticLogsResponse: Codable, PagedResponse {
    public typealias Data = DiagnosticLog
    /// The resource data.
    public let data: [DiagnosticLog]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [DiagnosticLog], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
