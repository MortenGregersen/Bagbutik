import Foundation

public struct DiagnosticLogsResponse: Codable {
    public let data: [DiagnosticLog]
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [DiagnosticLog], links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
