import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CertificateResponse
 A response that contains a single Certificates resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificateresponse>
 */
public struct CertificateResponse: Codable, Sendable {
    /// The resource data.
    public let data: Certificate
    public var included: [PassTypeId]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: Certificate,
                included: [PassTypeId]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Certificate.self, forKey: "data")
        included = try container.decodeIfPresent([PassTypeId].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
