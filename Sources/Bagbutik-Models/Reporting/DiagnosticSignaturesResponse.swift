import Bagbutik_Core
import Foundation

/**
 # DiagnosticSignaturesResponse
 A response that contains a list of Diagnostic Signature resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticsignaturesresponse>
 */
public struct DiagnosticSignaturesResponse: Codable, Sendable, PagedResponse {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([DiagnosticSignature].self, forKey: "data")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }
}
