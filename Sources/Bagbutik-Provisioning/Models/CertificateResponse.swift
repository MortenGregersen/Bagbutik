import Foundation

/**
 # CertificateResponse
 A response that contains a single Certificates resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificateresponse>
 */
public struct CertificateResponse: Codable {
    /// The resource data.
    public let data: Certificate
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: Certificate,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
