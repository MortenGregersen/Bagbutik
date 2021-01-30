import Foundation

public struct DiagnosticSignaturesResponse: Codable {
    public let data: [DiagnosticSignature]
    public let included: [DiagnosticLog]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [DiagnosticSignature], included: [DiagnosticLog]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
