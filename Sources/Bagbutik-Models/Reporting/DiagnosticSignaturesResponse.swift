import Bagbutik_Core
import Foundation

/**
 # DiagnosticSignaturesResponse
 A response that contains a list of Diagnostic Signature resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticsignaturesresponse>
 */
public struct DiagnosticSignaturesResponse: Codable, PagedResponse {
    public typealias Data = DiagnosticSignature

    /// An array of diagnostic signatures.
    public let data: [DiagnosticSignature]
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [DiagnosticSignature],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
