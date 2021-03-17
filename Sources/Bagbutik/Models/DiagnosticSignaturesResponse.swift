import Foundation

/// A response that contains a list of Diagnostic Signature resources.
public struct DiagnosticSignaturesResponse: Codable {
    /// The resource data.
    public let data: [DiagnosticSignature]
    public let included: [DiagnosticLog]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [DiagnosticSignature], included: [DiagnosticLog]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
